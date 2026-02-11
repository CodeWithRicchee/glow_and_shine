import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_button.dart';
import '../controllers/auth_controller.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back())),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.gapH16,
              Text('Verify OTP', style: GoogleFonts.playfairDisplay(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.deepPlum))
                  .animate().fadeIn(duration: 500.ms).slideX(begin: -0.1, end: 0, duration: 500.ms),
              AppSpacing.gapH8,
              Text('Enter the 6-digit code sent to your phone', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.warmGrey))
                  .animate().fadeIn(delay: 200.ms, duration: 500.ms),
              AppSpacing.gapH48,
              PinCodeTextField(
                appContext: context, length: 6, controller: controller.otpController,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box, borderRadius: AppSpacing.borderRadiusMd,
                  fieldHeight: 56, fieldWidth: 48,
                  activeFillColor: AppColors.softPink.withValues(alpha: 0.3),
                  inactiveFillColor: AppColors.softPink.withValues(alpha: 0.1),
                  selectedFillColor: AppColors.softPink.withValues(alpha: 0.5),
                  activeColor: AppColors.roseGold, inactiveColor: AppColors.lightDivider, selectedColor: AppColors.roseGold,
                ),
                enableActiveFill: true, keyboardType: TextInputType.number,
                textStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.deepPlum),
                onChanged: (_) {}, onCompleted: (_) => controller.verifyOtp(),
              ).animate().fadeIn(delay: 400.ms, duration: 500.ms).slideY(begin: 0.1, end: 0, delay: 400.ms, duration: 500.ms),
              AppSpacing.gapH24,
              Obx(() => GSGradientButton(text: 'Verify', isLoading: controller.isLoading.value, onPressed: controller.verifyOtp))
                  .animate().fadeIn(delay: 600.ms, duration: 400.ms),
              AppSpacing.gapH24,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Didn't receive the code? ", style: GoogleFonts.poppins(fontSize: 13, color: AppColors.warmGrey)),
                GestureDetector(onTap: controller.resendOtp, child: Text('Resend', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.roseGold))),
              ]).animate().fadeIn(delay: 700.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}
