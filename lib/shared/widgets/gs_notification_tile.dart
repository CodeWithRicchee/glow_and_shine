import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/notification_model.dart';
import '../../utils/formatters.dart';

class GSNotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const GSNotificationTile({
    super.key,
    required this.notification,
    this.onTap,
  });

  IconData get _icon {
    switch (notification.type) {
      case 'booking':
        return Iconsax.calendar_tick;
      case 'promo':
        return Iconsax.discount_shape;
      case 'review':
        return Iconsax.star;
      default:
        return Iconsax.notification;
    }
  }

  Color get _iconColor {
    switch (notification.type) {
      case 'booking':
        return AppColors.success;
      case 'promo':
        return AppColors.roseGold;
      case 'review':
        return AppColors.warning;
      default:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.transparent
              : AppColors.roseGold.withValues(alpha: 0.05),
          border: Border(
            bottom: BorderSide(
              color: AppColors.lightDivider.withValues(alpha: 0.5),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _iconColor.withValues(alpha: 0.1),
                borderRadius: AppSpacing.borderRadiusMd,
              ),
              child: Icon(_icon, color: _iconColor, size: 22),
            ),
            AppSpacing.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.w600,
                    ),
                  ),
                  AppSpacing.gapH4,
                  Text(
                    notification.message,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.coolGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacing.gapH4,
                  Text(
                    Formatters.relativeTime(notification.createdAt),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColors.coolGrey,
                    ),
                  ),
                ],
              ),
            ),
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.roseGold,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
