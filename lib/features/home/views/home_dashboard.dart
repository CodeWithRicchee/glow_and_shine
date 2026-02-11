import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_beautician_card.dart';
import '../../../shared/widgets/gs_cached_image.dart';
import '../../../shared/widgets/gs_section_header.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeDashboard extends GetView<HomeController> {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) return _shimmerLoading();
          return RefreshIndicator(
            color: AppColors.roseGold,
            onRefresh: controller.loadHomeData,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header().animate().fadeIn(duration: 400.ms),
                  AppSpacing.gapH16,
                  _offersCarousel().animate().fadeIn(delay: 200.ms, duration: 400.ms),
                  AppSpacing.gapH24,
                  _categoryGrid().animate().fadeIn(delay: 300.ms, duration: 400.ms),
                  AppSpacing.gapH24,
                  _featuredBeauticians().animate().fadeIn(delay: 400.ms, duration: 400.ms),
                  AppSpacing.gapH24,
                  _trendingLooks().animate().fadeIn(delay: 500.ms, duration: 400.ms),
                  AppSpacing.gapH32,
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Beautiful', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.coolGrey)),
                Text('Glow & Shine', style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notifications),
            icon: const Icon(Iconsax.notification, color: AppColors.deepPlum),
          ),
        ],
      ),
    );
  }

  Widget _offersCarousel() {
    return Obx(() => CarouselSlider.builder(
      itemCount: controller.offers.length,
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.88,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, _) => controller.currentCarouselIndex.value = index,
      ),
      itemBuilder: (context, index, _) {
        final offer = controller.offers[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: AppSpacing.borderRadiusLg,
            gradient: AppColors.roseGoldGradient,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: AppSpacing.borderRadiusLg,
                  child: Opacity(
                    opacity: 0.3,
                    child: GSCachedImage(imageUrl: offer.imageUrl, width: double.infinity, height: double.infinity),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${offer.discountPercent.toInt()}% OFF', style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                    AppSpacing.gapH4,
                    Text(offer.title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                    AppSpacing.gapH4,
                    Text(offer.description, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70)),
                    if (offer.code != null) ...[
                      AppSpacing.gapH8,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                        child: Text('Code: ${offer.code}', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }

  Widget _categoryGrid() {
    return Column(
      children: [
        GSSectionHeader(title: 'Event Categories', actionText: 'See All', onAction: () => Get.toNamed(AppRoutes.events)),
        AppSpacing.gapH12,
        Obx(() => SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: controller.eventCategories.length,
            separatorBuilder: (_, __) => AppSpacing.gapW12,
            itemBuilder: (_, index) {
              final cat = controller.eventCategories[index];
              return GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.eventDetail, arguments: cat),
                child: Column(
                  children: [
                    Container(
                      width: 60, height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.softPink,
                        borderRadius: AppSpacing.borderRadiusMd,
                      ),
                      child: Icon(cat.icon, color: AppColors.roseGold, size: 28),
                    ),
                    AppSpacing.gapH8,
                    Text(cat.name, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget _featuredBeauticians() {
    return Column(
      children: [
        GSSectionHeader(title: 'Featured Beauticians', actionText: 'See All', onAction: () {}),
        AppSpacing.gapH12,
        Obx(() => SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: controller.featuredBeauticians.length,
            separatorBuilder: (_, __) => AppSpacing.gapW16,
            itemBuilder: (_, index) {
              final b = controller.featuredBeauticians[index];
              return SizedBox(
                width: 200,
                child: GSBeauticianCard(
                  beautician: b,
                  onTap: () => Get.toNamed(AppRoutes.beauticianProfile, arguments: b),
                ),
              );
            },
          ),
        )),
      ],
    );
  }

  Widget _trendingLooks() {
    return Column(
      children: [
        GSSectionHeader(title: 'Trending Looks', actionText: 'See All', onAction: () {}),
        AppSpacing.gapH12,
        Obx(() => SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: controller.trendingLooks.length,
            separatorBuilder: (_, __) => AppSpacing.gapW12,
            itemBuilder: (_, index) => ClipRRect(
              borderRadius: AppSpacing.borderRadiusMd,
              child: GSCachedImage(
                imageUrl: controller.trendingLooks[index],
                width: 120,
                height: 140,
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _shimmerLoading() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        children: [
          AppSpacing.gapH32,
          const GSShimmerBox(height: 60, width: double.infinity),
          AppSpacing.gapH24,
          const GSShimmerBox(height: 180, width: double.infinity),
          AppSpacing.gapH24,
          Row(children: List.generate(4, (_) => const Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: GSShimmerBox(height: 80))))),
          AppSpacing.gapH24,
          const GSShimmerBox(height: 200, width: double.infinity),
        ],
      ),
    );
  }
}
