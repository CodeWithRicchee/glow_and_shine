import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/booking_model.dart';
import '../../utils/formatters.dart';
import 'gs_badge.dart';
import 'gs_cached_image.dart';

class GSBookingCard extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  const GSBookingCard({
    super.key,
    required this.booking,
    this.onTap,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: AppSpacing.borderRadiusLg,
          boxShadow: [
            BoxShadow(
              color: AppColors.deepPlum.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                GSCachedImage(
                  imageUrl: booking.beauticianImage,
                  width: 56,
                  height: 56,
                  borderRadius: AppSpacing.radiusMd,
                ),
                AppSpacing.gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.beauticianName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppSpacing.gapH4,
                      Text(
                        booking.serviceName,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.coolGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                GSBadge.status(booking.status),
              ],
            ),
            AppSpacing.gapH12,
            const Divider(height: 1),
            AppSpacing.gapH12,
            Row(
              children: [
                const Icon(Iconsax.calendar_1, size: 16, color: AppColors.coolGrey),
                AppSpacing.gapW8,
                Text(
                  Formatters.date(booking.dateTime),
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey),
                ),
                AppSpacing.gapW16,
                const Icon(Iconsax.clock, size: 16, color: AppColors.coolGrey),
                AppSpacing.gapW8,
                Text(
                  Formatters.time(booking.dateTime),
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey),
                ),
                const Spacer(),
                Text(
                  Formatters.currency(booking.totalPrice),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.roseGold,
                  ),
                ),
              ],
            ),
            if (booking.isUpcoming && onCancel != null) ...[
              AppSpacing.gapH12,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      'Cancel Booking',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
