import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_button.dart';
import '../../../shared/widgets/gs_text_field.dart';
import '../controllers/reviews_controller.dart';

class WriteReviewView extends GetView<ReviewsController> {
  const WriteReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.resetForm();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back()),
        title: Text('Write a Review', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppSpacing.gapH24,
          Center(child: Column(children: [
            Text('How was your experience?', style: GoogleFonts.playfairDisplay(fontSize: 20, fontWeight: FontWeight.bold)),
            AppSpacing.gapH8,
            Text('Tap the stars to rate', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.coolGrey)),
            AppSpacing.gapH16,
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              unratedColor: AppColors.coolGrey.withValues(alpha: 0.3),
              itemBuilder: (context, _) => const Icon(Iconsax.star1, color: AppColors.roseGold),
              onRatingUpdate: (rating) => controller.userRating.value = rating,
            ),
            AppSpacing.gapH8,
            Obx(() => controller.userRating.value > 0
                ? Text(_ratingLabel(controller.userRating.value), style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.roseGold))
                : const SizedBox.shrink()),
          ])).animate().fadeIn(duration: 400.ms),
          AppSpacing.gapH32,
          Text('Your Review', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)).animate().fadeIn(delay: 200.ms, duration: 400.ms),
          AppSpacing.gapH8,
          GSTextField(
            label: 'Share your experience...',
            controller: controller.commentController,
            maxLines: 5,
            prefixIcon: const Icon(Iconsax.message_text, color: AppColors.coolGrey),
          ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
          AppSpacing.gapH24,
          Text('Add Photos (optional)', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)).animate().fadeIn(delay: 400.ms, duration: 400.ms),
          AppSpacing.gapH8,
          Obx(() => Wrap(spacing: 8, runSpacing: 8, children: [
            ...controller.selectedPhotos.map((url) => Stack(children: [
              ClipRRect(borderRadius: AppSpacing.borderRadiusSm, child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover)),
              Positioned(top: 4, right: 4, child: GestureDetector(
                onTap: () => controller.selectedPhotos.remove(url),
                child: Container(width: 20, height: 20, decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle), child: const Icon(Icons.close, color: Colors.white, size: 12)),
              )),
            ])),
            GestureDetector(
              onTap: () => Get.snackbar('Coming Soon', 'Photo picker will be available soon', snackPosition: SnackPosition.BOTTOM),
              child: Container(
                width: 80, height: 80,
                decoration: BoxDecoration(border: Border.all(color: AppColors.coolGrey.withValues(alpha: 0.3), width: 1.5), borderRadius: AppSpacing.borderRadiusSm),
                child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Iconsax.camera, color: AppColors.coolGrey, size: 24), SizedBox(height: 4), Text('Add', style: TextStyle(fontSize: 11, color: AppColors.coolGrey))]),
              ),
            ),
          ])).animate().fadeIn(delay: 500.ms, duration: 400.ms),
          AppSpacing.gapH32,
          Obx(() => GSGradientButton(
            text: 'Submit Review',
            isLoading: controller.isSubmitting.value,
            onPressed: controller.submitReview,
          )).animate().fadeIn(delay: 600.ms, duration: 400.ms),
          AppSpacing.gapH32,
        ]),
      ),
    );
  }

  String _ratingLabel(double rating) {
    if (rating >= 4.5) return 'Amazing!';
    if (rating >= 3.5) return 'Great!';
    if (rating >= 2.5) return 'Good';
    if (rating >= 1.5) return 'Fair';
    return 'Poor';
  }
}
