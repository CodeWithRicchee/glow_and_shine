import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_avatar.dart';
import '../../../shared/widgets/gs_button.dart';
import '../../../shared/widgets/gs_text_field.dart';
import '../../../utils/validators.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back()), title: Text('Edit Profile', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600))),
      body: SingleChildScrollView(padding: AppSpacing.screenPadding, child: Column(children: [
        AppSpacing.gapH24,
        Center(child: Stack(children: [
          Obx(() => GSAvatar(imageUrl: controller.user.value?.avatarUrl, name: controller.user.value?.name, size: 100, hasBorder: true)),
          Positioned(bottom: 0, right: 0, child: Container(width: 32, height: 32, decoration: const BoxDecoration(color: AppColors.roseGold, shape: BoxShape.circle), child: const Icon(Iconsax.camera, color: Colors.white, size: 16))),
        ])).animate().fadeIn(duration: 400.ms),
        AppSpacing.gapH32,
        GSTextField(label: 'Full Name', controller: controller.nameController, validator: Validators.name, prefixIcon: const Icon(Iconsax.user, color: AppColors.coolGrey)).animate().fadeIn(delay: 200.ms, duration: 400.ms),
        AppSpacing.gapH16,
        GSTextField(label: 'Email', controller: controller.emailController, validator: Validators.email, keyboardType: TextInputType.emailAddress, prefixIcon: const Icon(Iconsax.sms, color: AppColors.coolGrey)).animate().fadeIn(delay: 300.ms, duration: 400.ms),
        AppSpacing.gapH16,
        GSTextField(label: 'Phone', controller: controller.phoneController, validator: Validators.phone, keyboardType: TextInputType.phone, prefixIcon: const Icon(Iconsax.call, color: AppColors.coolGrey)).animate().fadeIn(delay: 400.ms, duration: 400.ms),
        AppSpacing.gapH16,
        GSTextField(label: 'Address', controller: controller.addressController, prefixIcon: const Icon(Iconsax.location, color: AppColors.coolGrey), maxLines: 2).animate().fadeIn(delay: 500.ms, duration: 400.ms),
        AppSpacing.gapH32,
        Obx(() => GSGradientButton(text: 'Save Changes', isLoading: controller.isLoading.value, onPressed: controller.updateProfile)).animate().fadeIn(delay: 600.ms, duration: 400.ms),
        AppSpacing.gapH32,
      ])),
    );
  }
}
