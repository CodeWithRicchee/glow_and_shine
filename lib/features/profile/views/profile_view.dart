import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_avatar.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) Get.put(ProfileController());
    final c = Get.find<ProfileController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (c.isLoading.value && c.user.value == null) return Padding(padding: AppSpacing.screenPadding, child: Column(children: [AppSpacing.gapH32, const GSShimmerBox(height: 80, width: 80), AppSpacing.gapH16, const GSShimmerBox(height: 20, width: 150), AppSpacing.gapH32, ...List.generate(5, (_) => const Padding(padding: EdgeInsets.only(bottom: 12), child: GSShimmerBox(height: 56)))]));
          final user = c.user.value;
          return SingleChildScrollView(padding: AppSpacing.screenPadding, child: Column(children: [
            AppSpacing.gapH16,
            GSAvatar(imageUrl: user?.avatarUrl, name: user?.name, size: 80, hasBorder: true).animate().scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0), duration: 400.ms),
            AppSpacing.gapH16,
            Text(user?.name ?? '', style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold)).animate().fadeIn(delay: 200.ms, duration: 400.ms),
            AppSpacing.gapH4,
            Text(user?.email ?? '', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.coolGrey)).animate().fadeIn(delay: 300.ms, duration: 400.ms),
            AppSpacing.gapH32,
            _item(Iconsax.user_edit, 'Edit Profile', '', onTap: () => Get.toNamed(AppRoutes.editProfile)).animate().fadeIn(delay: 400.ms, duration: 300.ms),
            _item(Iconsax.heart, 'Favorites', '12 saved').animate().fadeIn(delay: 450.ms, duration: 300.ms),
            _item(Iconsax.card, 'Payment Methods', '2 cards').animate().fadeIn(delay: 500.ms, duration: 300.ms),
            _item(Iconsax.notification, 'Notifications', '', onTap: () => Get.toNamed(AppRoutes.notifications)).animate().fadeIn(delay: 550.ms, duration: 300.ms),
            _item(Iconsax.star, 'My Reviews', '', onTap: () => Get.toNamed(AppRoutes.reviews)).animate().fadeIn(delay: 600.ms, duration: 300.ms),
            AppSpacing.gapH8,
            Obx(() => _switchItem(Iconsax.moon, 'Dark Mode', c.isDarkMode.value, onChanged: c.toggleDarkMode)).animate().fadeIn(delay: 650.ms, duration: 300.ms),
            AppSpacing.gapH8,
            _item(Iconsax.info_circle, 'About', '').animate().fadeIn(delay: 700.ms, duration: 300.ms),
            _item(Iconsax.message_question, 'Help & Support', '').animate().fadeIn(delay: 750.ms, duration: 300.ms),
            AppSpacing.gapH16,
            _item(Iconsax.logout, 'Logout', '', isDestructive: true, onTap: () => _logoutDialog(c)).animate().fadeIn(delay: 800.ms, duration: 300.ms),
            AppSpacing.gapH32,
          ]));
        }),
      ),
    );
  }

  Widget _item(IconData icon, String title, String sub, {VoidCallback? onTap, bool isDestructive = false}) => ListTile(onTap: onTap,
    leading: Container(width: 40, height: 40, decoration: BoxDecoration(color: isDestructive ? AppColors.error.withValues(alpha: 0.1) : AppColors.softPink, borderRadius: AppSpacing.borderRadiusSm), child: Icon(icon, color: isDestructive ? AppColors.error : AppColors.roseGold, size: 20)),
    title: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: isDestructive ? AppColors.error : null)),
    subtitle: sub.isNotEmpty ? Text(sub, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey)) : null,
    trailing: Icon(Iconsax.arrow_right_3, size: 18, color: AppColors.coolGrey), contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2));

  Widget _switchItem(IconData icon, String title, bool value, {required ValueChanged<bool> onChanged}) => ListTile(
    leading: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.softPink, borderRadius: AppSpacing.borderRadiusSm), child: Icon(icon, color: AppColors.roseGold, size: 20)),
    title: Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
    trailing: Switch(value: value, onChanged: onChanged, activeColor: AppColors.roseGold), contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2));

  void _logoutDialog(ProfileController c) {
    Get.dialog(AlertDialog(shape: RoundedRectangleBorder(borderRadius: AppSpacing.borderRadiusLg),
      title: Text('Logout', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
      content: Text('Are you sure you want to logout?', style: GoogleFonts.poppins(fontSize: 14)),
      actions: [TextButton(onPressed: () => Get.back(), child: const Text('Cancel')), ElevatedButton(onPressed: () { Get.back(); c.logout(); }, style: ElevatedButton.styleFrom(backgroundColor: AppColors.error), child: const Text('Logout'))]));
  }
}
