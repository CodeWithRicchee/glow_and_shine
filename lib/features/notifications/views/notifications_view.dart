import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_empty_state.dart';
import '../../../shared/widgets/gs_notification_tile.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () => Get.back()),
        title: Text('Notifications', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
        actions: [
          Obx(() => controller.unreadCount.value > 0
              ? TextButton(
                  onPressed: controller.markAllAsRead,
                  child: Text('Mark all read', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.roseGold)),
                )
              : const SizedBox.shrink()),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Padding(
            padding: AppSpacing.screenPadding,
            child: Column(children: List.generate(5, (_) => const Padding(padding: EdgeInsets.only(bottom: 8), child: GSShimmerBox(height: 72)))),
          );
        }
        if (controller.notifications.isEmpty) {
          return const GSEmptyState(
            icon: Iconsax.notification,
            title: 'No Notifications',
            subtitle: 'You\'re all caught up! Check back later for updates.',
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return Dismissible(
              key: Key(notification.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                color: AppColors.error.withValues(alpha: 0.1),
                child: const Icon(Iconsax.trash, color: AppColors.error),
              ),
              onDismissed: (_) => controller.deleteNotification(notification.id),
              child: GSNotificationTile(
                notification: notification,
                onTap: () => controller.markAsRead(notification.id),
              ),
            ).animate().fadeIn(delay: Duration(milliseconds: 50 * index), duration: 300.ms).slideX(begin: 0.05, end: 0, delay: Duration(milliseconds: 50 * index), duration: 300.ms);
          },
        );
      }),
    );
  }
}
