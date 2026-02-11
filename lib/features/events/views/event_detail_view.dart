import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../data/models/event_category_model.dart';
import '../../../shared/widgets/gs_beautician_card.dart';
import '../../../shared/widgets/gs_cached_image.dart';
import '../../../shared/widgets/gs_section_header.dart';
import '../../../shared/widgets/gs_service_card.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/events_controller.dart';

class EventDetailView extends GetView<EventsController> {
  const EventDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments as EventCategoryModel?;
    if (category != null && controller.selectedCategory.value?.id != category.id) {
      controller.loadCategoryDetails(category);
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white54,
                child: Icon(Iconsax.arrow_left, color: Colors.black),
              ),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category?.name ?? 'Event', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold, fontSize: 20)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (category != null) GSCachedImage(imageUrl: category.imageUrl, width: double.infinity, height: double.infinity),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withValues(alpha: 0.6)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Padding(
                  padding: AppSpacing.screenPadding,
                  child: Column(children: [
                    AppSpacing.gapH24,
                    ...List.generate(3, (_) => const Padding(padding: EdgeInsets.only(bottom: 12), child: GSShimmerBox(height: 80))),
                  ]),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (category != null) ...[
                      Text(category.description, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.coolGrey, height: 1.5)).animate().fadeIn(duration: 400.ms),
                      AppSpacing.gapH24,
                    ],
                    GSSectionHeader(title: 'Services', actionText: ''),
                    AppSpacing.gapH12,
                    ...controller.categoryServices.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GSServiceCard(
                        service: e.value,
                        onTap: () => Get.toNamed(AppRoutes.booking, arguments: {'service': e.value}),
                      ),
                    ).animate().fadeIn(delay: Duration(milliseconds: 80 * e.key), duration: 300.ms)),
                    AppSpacing.gapH24,
                    GSSectionHeader(title: 'Top Beauticians', actionText: ''),
                    AppSpacing.gapH12,
                    ...controller.categoryBeauticians.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GSBeauticianCard(
                        beautician: e.value,
                        compact: true,
                        onTap: () => Get.toNamed(AppRoutes.beauticianProfile, arguments: e.value),
                      ),
                    ).animate().fadeIn(delay: Duration(milliseconds: 80 * e.key + 200), duration: 300.ms)),
                    AppSpacing.gapH32,
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
