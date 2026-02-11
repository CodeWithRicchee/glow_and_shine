import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/providers/local_storage_provider.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final agreeToTerms = false.obs;

  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleTerms() => agreeToTerms.toggle();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    Get.find<LocalStorageProvider>().saveToken('demo_token');
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.home);
  }

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;
    if (!agreeToTerms.value) {
      Get.snackbar('Terms Required', 'Please agree to terms and conditions', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(AppRoutes.otp);
  }

  Future<void> verifyOtp() async {
    if (otpController.text.length != 6) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    Get.find<LocalStorageProvider>().saveToken('demo_token');
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.home);
  }

  Future<void> resendOtp() async {
    Get.snackbar('OTP Sent', 'A new OTP has been sent to your phone', snackPosition: SnackPosition.BOTTOM);
  }

  void goToSignup() => Get.toNamed(AppRoutes.signup);
  void goToLogin() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
