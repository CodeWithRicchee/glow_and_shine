import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/offer_model.dart';

class GSOfferCard extends StatelessWidget {
  final OfferModel offer;
  final VoidCallback? onTap;

  const GSOfferCard({super.key, required this.offer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: AppSpacing.paddingLg,
        decoration: BoxDecoration(
          gradient: AppColors.plumGradient,
          borderRadius: AppSpacing.borderRadiusXl,
          boxShadow: [
            BoxShadow(
              color: AppColors.deepPlum.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.roseGold.withValues(alpha: 0.1),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${offer.discountPercent.toInt()}% OFF',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.roseGold,
                  ),
                ),
                AppSpacing.gapH8,
                Text(
                  offer.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                AppSpacing.gapH4,
                Text(
                  offer.description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (offer.code != null) ...[
                  AppSpacing.gapH12,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.roseGold.withValues(alpha: 0.5),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      'Code: ${offer.code}',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.champagne,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
