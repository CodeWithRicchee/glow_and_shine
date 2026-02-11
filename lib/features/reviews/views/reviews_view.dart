import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_review_card.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/reviews_controller.dart';

class ReviewsView extends GetView<ReviewsController> {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back()),
        title: Text('My Reviews', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoutes.writeReview),
        backgroundColor: AppColors.roseGold,
        icon: const Icon(Iconsax.edit, color: Colors.white),
        label: Text('Write Review', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Padding(
            padding: AppSpacing.screenPadding,
            child: Column(children: List.generate(3, (_) => const Padding(padding: EdgeInsets.only(bottom: 12), child: GSShimmerBox(height: 140)))),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _ratingSummary()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GSReviewCard(review: controller.reviews[index])
                        .animate()
                        .fadeIn(delay: Duration(milliseconds: 80 * index), duration: 300.ms)
                        .slideY(begin: 0.05, end: 0, delay: Duration(milliseconds: 80 * index), duration: 300.ms),
                  ),
                  childCount: controller.reviews.length,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _ratingSummary() {
    return Obx(() => Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.champagneGradient,
        borderRadius: AppSpacing.borderRadiusLg,
      ),
      child: Row(children: [
        Column(children: [
          Text(controller.averageRating.value.toStringAsFixed(1), style: GoogleFonts.playfairDisplay(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.deepPlum)),
          Row(children: List.generate(5, (i) => Icon(i < controller.averageRating.value.round() ? Iconsax.star1 : Iconsax.star, size: 16, color: AppColors.roseGold))),
          AppSpacing.gapH4,
          Text('${controller.reviews.length} reviews', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey)),
        ]),
        AppSpacing.gapW24,
        Expanded(child: Column(
          children: List.generate(5, (i) {
            final star = 5 - i;
            final count = controller.ratingDistribution[star] ?? 0;
            final total = controller.reviews.length;
            final pct = total > 0 ? count / total : 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(children: [
                Text('$star', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500)),
                const SizedBox(width: 4),
                const Icon(Iconsax.star1, size: 12, color: AppColors.roseGold),
                const SizedBox(width: 8),
                Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(value: pct, backgroundColor: Colors.white.withValues(alpha: 0.5), valueColor: const AlwaysStoppedAnimation(AppColors.roseGold), minHeight: 6))),
                const SizedBox(width: 8),
                Text('$count', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.coolGrey)),
              ]),
            );
          }),
        )),
      ]),
    )).animate().fadeIn(duration: 400.ms);
  }
}
