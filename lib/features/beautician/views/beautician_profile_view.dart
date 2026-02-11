import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_button.dart';
import '../../../shared/widgets/gs_cached_image.dart';
import '../../../shared/widgets/gs_review_card.dart';
import '../../../shared/widgets/gs_service_card.dart';
import '../controllers/beautician_controller.dart';

class BeauticianProfileView extends GetView<BeauticianController> {
  const BeauticianProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final b = controller.beautician.value;
        if (b == null) return const SizedBox.shrink();
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 320, pinned: true,
              leading: IconButton(
                icon: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), shape: BoxShape.circle), child: const Icon(Iconsax.arrow_left, size: 20)),
                onPressed: () => Get.back(),
              ),
              actions: [
                Obx(() => IconButton(
                  icon: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), shape: BoxShape.circle),
                    child: Icon(controller.isFavorite.value ? Iconsax.heart5 : Iconsax.heart, size: 20, color: controller.isFavorite.value ? AppColors.roseGold : null)),
                  onPressed: controller.toggleFavorite,
                )),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(fit: StackFit.expand, children: [
                  Hero(tag: 'beautician_${b.id}', child: GSCachedImage(imageUrl: b.imageUrl, fit: BoxFit.cover)),
                  Container(decoration: const BoxDecoration(gradient: AppColors.heroGradient)),
                  Positioned(bottom: 16, left: 20, right: 20, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(b.name, style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                    AppSpacing.gapH4,
                    Text(b.specialty, style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70)),
                  ])),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  _stat('${b.rating}', 'Rating', Iconsax.star5),
                  Container(height: 40, width: 1, color: AppColors.lightDivider),
                  _stat('${b.reviewCount}', 'Reviews', Iconsax.message),
                  Container(height: 40, width: 1, color: AppColors.lightDivider),
                  _stat('${b.experienceYears}yr', 'Exp', Iconsax.award),
                  Container(height: 40, width: 1, color: AppColors.lightDivider),
                  _stat('\$${b.pricePerHour.toInt()}', '/hour', Iconsax.dollar_circle),
                ]).animate().fadeIn(duration: 400.ms),
              ),
            ),
            SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(b.bio, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.warmGrey, height: 1.6)))),
            SliverToBoxAdapter(child: TabBar(controller: controller.tabController, labelColor: AppColors.roseGold, unselectedLabelColor: AppColors.coolGrey, indicatorColor: AppColors.roseGold, labelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600), tabs: const [Tab(text: 'Portfolio'), Tab(text: 'Services'), Tab(text: 'Reviews'), Tab(text: 'Schedule')])),
            SliverFillRemaining(child: TabBarView(controller: controller.tabController, children: [_portfolioTab(), _servicesTab(), _reviewsTab(), _scheduleTab()])),
          ],
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [BoxShadow(color: AppColors.deepPlum.withValues(alpha: 0.08), blurRadius: 20, offset: const Offset(0, -4))]),
        child: GSGradientButton(text: 'Book Now', onPressed: () => Get.toNamed(AppRoutes.booking, arguments: {'beautician': controller.beautician.value})),
      ),
    );
  }

  Widget _stat(String value, String label, IconData icon) => Column(children: [
    Icon(icon, color: AppColors.roseGold, size: 22), AppSpacing.gapH4,
    Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepPlum)),
    Text(label, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.coolGrey)),
  ]);

  Widget _portfolioTab() => Obx(() => Padding(padding: AppSpacing.screenPadding, child: MasonryGridView.count(
    crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, itemCount: controller.portfolio.length,
    itemBuilder: (_, index) {
      final heights = [150.0, 200.0, 170.0, 220.0, 180.0, 160.0, 210.0, 190.0, 175.0];
      return ClipRRect(borderRadius: AppSpacing.borderRadiusMd, child: Container(
        height: heights[index % heights.length],
        decoration: BoxDecoration(gradient: index % 2 == 0 ? AppColors.roseGoldGradient : AppColors.champagneGradient),
        child: controller.portfolio[index].title != null ? Align(alignment: Alignment.bottomLeft, child: Padding(padding: const EdgeInsets.all(8), child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(6)),
          child: Text(controller.portfolio[index].title!, style: GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
        ))) : null,
      )).animate().fadeIn(delay: Duration(milliseconds: 60 * index), duration: 300.ms);
    },
  )));

  Widget _servicesTab() => Obx(() => ListView.separated(padding: AppSpacing.screenPadding, itemCount: controller.services.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
    itemBuilder: (_, index) => GSServiceCard(service: controller.services[index], onTap: () => Get.toNamed(AppRoutes.booking, arguments: {'beautician': controller.beautician.value, 'service': controller.services[index]})).animate().fadeIn(delay: Duration(milliseconds: 80 * index), duration: 300.ms)));

  Widget _reviewsTab() => Obx(() => ListView.separated(padding: AppSpacing.screenPadding, itemCount: controller.reviews.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
    itemBuilder: (_, index) => GSReviewCard(review: controller.reviews[index]).animate().fadeIn(delay: Duration(milliseconds: 80 * index), duration: 300.ms)));

  Widget _scheduleTab() => Obx(() => ListView.separated(padding: AppSpacing.screenPadding, itemCount: controller.availability.length, separatorBuilder: (_, __) => AppSpacing.gapH8,
    itemBuilder: (_, index) {
      final a = controller.availability[index];
      return Container(padding: AppSpacing.paddingMd, decoration: BoxDecoration(color: a.isAvailable ? AppColors.success.withValues(alpha: 0.05) : AppColors.error.withValues(alpha: 0.05), borderRadius: AppSpacing.borderRadiusMd, border: Border.all(color: a.isAvailable ? AppColors.success.withValues(alpha: 0.2) : AppColors.error.withValues(alpha: 0.2))),
        child: Row(children: [SizedBox(width: 50, child: Text(a.dayName, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600))), AppSpacing.gapW16, a.isAvailable ? Text('${a.startTime} - ${a.endTime}', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.warmGrey)) : Text('Unavailable', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.error)), const Spacer(), Icon(a.isAvailable ? Iconsax.tick_circle5 : Iconsax.close_circle5, color: a.isAvailable ? AppColors.success : AppColors.error, size: 20)]));
    }));
}
