import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/models/user_model.dart';
import '../../../data/providers/local_storage_provider.dart';

class ProfileController extends GetxController {
  final isLoading = true.obs;
  final user = Rxn<UserModel>();
  final isDarkMode = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() { super.onInit(); isDarkMode.value = Get.find<LocalStorageProvider>().isDarkMode; loadProfile(); }

  Future<void> loadProfile() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    user.value = UserModel(id: 'u1', name: 'Alexandra Rose', email: 'alexandra@example.com', phone: '+1 (555) 123-4567', avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400', address: '123 Beauty Lane, New York, NY', createdAt: DateTime(2024, 1, 15));
    nameController.text = user.value!.name; emailController.text = user.value!.email; phoneController.text = user.value!.phone; addressController.text = user.value!.address ?? '';
    isLoading.value = false;
  }

  void toggleDarkMode(bool value) { isDarkMode.value = value; Get.find<LocalStorageProvider>().setDarkMode(value); Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light); }

  Future<void> updateProfile() async {
    isLoading.value = true; await Future.delayed(const Duration(seconds: 1));
    user.value = UserModel(id: user.value!.id, name: nameController.text, email: emailController.text, phone: phoneController.text, avatarUrl: user.value!.avatarUrl, address: addressController.text, createdAt: user.value!.createdAt);
    isLoading.value = false; Get.back(); Get.snackbar('Success', 'Profile updated successfully', snackPosition: SnackPosition.BOTTOM);
  }

  void logout() { Get.find<LocalStorageProvider>().clearToken(); Get.offAllNamed(AppRoutes.login); }

  @override
  void onClose() { nameController.dispose(); emailController.dispose(); phoneController.dispose(); addressController.dispose(); super.onClose(); }
}
