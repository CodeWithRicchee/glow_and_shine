import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.completeOnboarding,
                child: Text('Skip', style: GoogleFonts.poppins(color: AppColors.coolGrey)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.currentPage.value = index,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return Padding(
                    padding: AppSpacing.screenPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160, height: 160,
                          decoration: BoxDecoration(
                            gradient: AppColors.roseGoldGradient, shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: AppColors.roseGold.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 5)],
                          ),
                          child: Icon(page.icon, size: 72, color: Colors.white),
                        ).animate().scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0), duration: 600.ms, curve: Curves.easeOut).fadeIn(duration: 600.ms),
                        AppSpacing.gapH48,
                        Text(page.title, style: GoogleFonts.playfairDisplay(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.deepPlum), textAlign: TextAlign.center)
                            .animate().fadeIn(delay: 200.ms, duration: 500.ms).slideY(begin: 0.2, end: 0, delay: 200.ms, duration: 500.ms),
                        AppSpacing.gapH16,
                        Text(page.subtitle, style: GoogleFonts.poppins(fontSize: 15, color: AppColors.warmGrey, height: 1.6), textAlign: TextAlign.center)
                            .animate().fadeIn(delay: 400.ms, duration: 500.ms),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.roseGold,
                      dotColor: AppColors.roseGoldLight.withValues(alpha: 0.3),
                      dotHeight: 8, dotWidth: 8, expansionFactor: 4,
                    ),
                  ),
                  AppSpacing.gapH32,
                  Obx(() => GSGradientButton(
                    text: controller.currentPage.value == controller.pages.length - 1 ? 'Get Started' : 'Next',
                    onPressed: controller.nextPage,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
