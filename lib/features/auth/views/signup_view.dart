import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_button.dart';
import '../../../shared/widgets/gs_text_field.dart';
import '../../../utils/validators.dart';
import '../controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back())),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.gapH16,
                Text('Create\nAccount', style: GoogleFonts.playfairDisplay(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.deepPlum, height: 1.2))
                    .animate().fadeIn(duration: 500.ms).slideX(begin: -0.1, end: 0, duration: 500.ms),
                AppSpacing.gapH8,
                Text('Join our community of beauty enthusiasts', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.warmGrey))
                    .animate().fadeIn(delay: 200.ms, duration: 500.ms),
                AppSpacing.gapH32,
                GSTextField(label: 'Full Name', hint: 'Enter your name', controller: controller.nameController, validator: Validators.name, prefixIcon: const Icon(Iconsax.user, color: AppColors.coolGrey))
                    .animate().fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 300.ms, duration: 400.ms),
                AppSpacing.gapH16,
                GSTextField(label: 'Email', hint: 'Enter your email', controller: controller.emailController, keyboardType: TextInputType.emailAddress, validator: Validators.email, prefixIcon: const Icon(Iconsax.sms, color: AppColors.coolGrey))
                    .animate().fadeIn(delay: 400.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 400.ms, duration: 400.ms),
                AppSpacing.gapH16,
                GSTextField(label: 'Phone', hint: 'Enter your phone number', controller: controller.phoneController, keyboardType: TextInputType.phone, validator: Validators.phone, prefixIcon: const Icon(Iconsax.call, color: AppColors.coolGrey))
                    .animate().fadeIn(delay: 500.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 500.ms, duration: 400.ms),
                AppSpacing.gapH16,
                Obx(() => GSTextField(
                  label: 'Password', hint: 'Create a password', controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value, validator: Validators.password,
                  prefixIcon: const Icon(Iconsax.lock, color: AppColors.coolGrey),
                  suffixIcon: IconButton(icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash, color: AppColors.coolGrey), onPressed: controller.togglePasswordVisibility),
                )).animate().fadeIn(delay: 600.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 600.ms, duration: 400.ms),
                AppSpacing.gapH16,
                Obx(() => Row(children: [
                  Checkbox(value: controller.agreeToTerms.value, onChanged: (_) => controller.toggleTerms(), activeColor: AppColors.roseGold, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  Expanded(child: Text.rich(TextSpan(text: 'I agree to the ', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.warmGrey), children: [TextSpan(text: 'Terms & Conditions', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.roseGold, fontWeight: FontWeight.w500))]))),
                ])).animate().fadeIn(delay: 700.ms, duration: 400.ms),
                AppSpacing.gapH24,
                Obx(() => GSGradientButton(text: 'Create Account', isLoading: controller.isLoading.value, onPressed: controller.signup))
                    .animate().fadeIn(delay: 800.ms, duration: 400.ms),
                AppSpacing.gapH24,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Already have an account? ', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.warmGrey)),
                  GestureDetector(onTap: controller.goToLogin, child: Text('Sign In', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.roseGold))),
                ]),
                AppSpacing.gapH32,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
