import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_beautician_card.dart';
import '../../../shared/widgets/gs_chip.dart';
import '../../../shared/widgets/gs_empty_state.dart';
import '../../../shared/widgets/gs_search_bar.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SearchPageController>()) Get.put(SearchPageController());
    final c = Get.find<SearchPageController>();
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(padding: const EdgeInsets.fromLTRB(20, 16, 20, 0), child: GSSearchBar(controller: c.searchController, onChanged: c.onSearchChanged, onFilterTap: () => _showFilterSheet(context, c))),
          Expanded(child: Obx(() {
            if (c.isLoading.value) return _shimmer();
            if (!c.hasSearched.value) return _recentSearches(c);
            if (c.searchResults.isEmpty) return const GSEmptyState(icon: Iconsax.search_normal, title: 'No results found', subtitle: 'Try adjusting your search or filters');
            return ListView.separated(padding: const EdgeInsets.all(20), itemCount: c.searchResults.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
              itemBuilder: (_, i) => GSBeauticianCard(beautician: c.searchResults[i], compact: true, onTap: () => Get.toNamed(AppRoutes.beauticianProfile, arguments: c.searchResults[i])).animate().fadeIn(delay: Duration(milliseconds: 60 * i), duration: 300.ms));
          })),
        ]),
      ),
    );
  }

  Widget _recentSearches(SearchPageController c) => Obx(() => Padding(padding: AppSpacing.screenPadding, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    AppSpacing.gapH24,
    Text('Recent Searches', style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.w600)),
    AppSpacing.gapH16,
    Wrap(spacing: 8, runSpacing: 8, children: c.recentSearches.map((s) => GSChip(label: s, icon: Iconsax.clock, onTap: () { c.searchController.text = s; c.performSearch(s); })).toList()),
    AppSpacing.gapH32,
    Text('Popular Categories', style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.w600)),
    AppSpacing.gapH16,
    Wrap(spacing: 8, runSpacing: 8, children: ['Wedding', 'Fashion', 'Corporate', 'Prom', 'Festival', 'Birthday'].map((cat) => GSChip(label: cat, onTap: () { c.searchController.text = cat; c.performSearch(cat); })).toList()),
  ])));

  Widget _shimmer() => Padding(padding: AppSpacing.screenPadding, child: Column(children: List.generate(5, (_) => const Padding(padding: EdgeInsets.only(top: 12), child: GSShimmerBox(height: 80)))));

  void _showFilterSheet(BuildContext context, SearchPageController c) {
    Get.bottomSheet(Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Filters', style: GoogleFonts.playfairDisplay(fontSize: 22, fontWeight: FontWeight.bold)), TextButton(onPressed: c.resetFilters, child: const Text('Reset'))]),
        AppSpacing.gapH24,
        Text('Price Range', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)), AppSpacing.gapH8,
        Obx(() => RangeSlider(values: RangeValues(c.minPrice.value, c.maxPrice.value), min: 0, max: 500, divisions: 50, activeColor: AppColors.roseGold, labels: RangeLabels('\$${c.minPrice.value.toInt()}', '\$${c.maxPrice.value.toInt()}'), onChanged: (v) { c.minPrice.value = v.start; c.maxPrice.value = v.end; })),
        AppSpacing.gapH16,
        Text('Minimum Rating', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)), AppSpacing.gapH8,
        Obx(() => Slider(value: c.minRating.value, min: 0, max: 5, divisions: 10, activeColor: AppColors.roseGold, label: c.minRating.value.toStringAsFixed(1), onChanged: (v) => c.minRating.value = v)),
        AppSpacing.gapH24,
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: c.applyFilters, child: const Text('Apply Filters'))),
      ])));
  }
}
