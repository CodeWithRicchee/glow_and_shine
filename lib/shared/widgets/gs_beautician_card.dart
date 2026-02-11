import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/beautician_model.dart';
import '../../utils/formatters.dart';
import 'gs_cached_image.dart';
import 'gs_rating.dart';

class GSBeauticianCard extends StatelessWidget {
  final BeauticianModel beautician;
  final VoidCallback? onTap;
  final bool compact;

  const GSBeauticianCard({
    super.key,
    required this.beautician,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) return _compact(context);
    return _full(context);
  }

  Widget _full(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'beautician_${beautician.id}',
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: GSCachedImage(
                  imageUrl: beautician.imageUrl,
                  height: 180,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: AppSpacing.paddingMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beautician.name,
                    style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.gapH4,
                  Text(
                    beautician.specialty,
                    style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey),
                  ),
                  AppSpacing.gapH8,
                  Row(
                    children: [
                      GSRating(rating: beautician.rating, size: 14),
                      AppSpacing.gapW8,
                      Text(
                        '(${beautician.reviewCount})',
                        style: GoogleFonts.poppins(fontSize: 11, color: AppColors.coolGrey),
                      ),
                      const Spacer(),
                      Text(
                        '${Formatters.currency(beautician.pricePerHour)}/hr',
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.roseGold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compact(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: AppSpacing.borderRadiusMd,
          boxShadow: [
            BoxShadow(
              color: AppColors.deepPlum.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: 'beautician_${beautician.id}',
              child: ClipRRect(
                borderRadius: AppSpacing.borderRadiusSm,
                child: GSCachedImage(
                  imageUrl: beautician.imageUrl,
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            AppSpacing.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beautician.name,
                    style: GoogleFonts.playfairDisplay(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.gapH4,
                  Text(
                    beautician.specialty,
                    style: GoogleFonts.poppins(fontSize: 12, color: AppColors.coolGrey),
                  ),
                  AppSpacing.gapH4,
                  Row(
                    children: [
                      const Icon(Iconsax.star1, size: 14, color: AppColors.roseGold),
                      const SizedBox(width: 4),
                      Text(
                        '${beautician.rating}',
                        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ' (${beautician.reviewCount})',
                        style: GoogleFonts.poppins(fontSize: 11, color: AppColors.coolGrey),
                      ),
                      const Spacer(),
                      Text(
                        '${Formatters.currency(beautician.pricePerHour)}/hr',
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.roseGold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppSpacing.gapW8,
            const Icon(Iconsax.arrow_right_3, size: 18, color: AppColors.coolGrey),
          ],
        ),
      ),
    );
  }
}
