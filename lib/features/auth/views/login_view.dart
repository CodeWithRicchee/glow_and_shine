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

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.gapH48,
                Text('Welcome\nBack', style: GoogleFonts.playfairDisplay(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.deepPlum, height: 1.2))
                    .animate().fadeIn(duration: 500.ms).slideX(begin: -0.1, end: 0, duration: 500.ms),
                AppSpacing.gapH8,
                Text('Sign in to continue your beauty journey', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.warmGrey))
                    .animate().fadeIn(delay: 200.ms, duration: 500.ms),
                AppSpacing.gapH48,
                GSTextField(
                  label: 'Email', hint: 'Enter your email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                  prefixIcon: const Icon(Iconsax.sms, color: AppColors.coolGrey),
                ).animate().fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 300.ms, duration: 400.ms),
                AppSpacing.gapH16,
                Obx(() => GSTextField(
                  label: 'Password', hint: 'Enter your password',
                  controller: controller.passwordController,
                  obscureText: !controller.isPasswordVisible.value,
                  validator: Validators.password,
                  prefixIcon: const Icon(Iconsax.lock, color: AppColors.coolGrey),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash, color: AppColors.coolGrey),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                )).animate().fadeIn(delay: 400.ms, duration: 400.ms).slideY(begin: 0.1, end: 0, delay: 400.ms, duration: 400.ms),
                AppSpacing.gapH12,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: () {}, child: Text('Forgot Password?', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.roseGold, fontWeight: FontWeight.w500))),
                ),
                AppSpacing.gapH24,
                Obx(() => GSGradientButton(text: 'Sign In', isLoading: controller.isLoading.value, onPressed: controller.login))
                    .animate().fadeIn(delay: 500.ms, duration: 400.ms),
                AppSpacing.gapH24,
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text('or continue with', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey))),
                    const Expanded(child: Divider()),
                  ],
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
                AppSpacing.gapH24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(Icons.g_mobiledata_rounded, 'Google'),
                    AppSpacing.gapW16,
                    _socialButton(Icons.apple, 'Apple'),
                  ],
                ).animate().fadeIn(delay: 700.ms, duration: 400.ms),
                AppSpacing.gapH32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: GoogleFonts.poppins(fontSize: 13, color: AppColors.warmGrey)),
                    GestureDetector(onTap: controller.goToSignup, child: Text('Sign Up', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.roseGold))),
                  ],
                ).animate().fadeIn(delay: 800.ms, duration: 400.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(border: Border.all(color: AppColors.lightDivider), borderRadius: AppSpacing.borderRadiusMd),
      child: Row(children: [Icon(icon, size: 24, color: AppColors.deepPlum), AppSpacing.gapW8, Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500))]),
    );
  }
}
