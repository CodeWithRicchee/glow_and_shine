import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/event_category_model.dart';

class GSEventCategoryCard extends StatelessWidget {
  final EventCategoryModel category;
  final VoidCallback? onTap;
  final bool large;

  const GSEventCategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    if (large) return _buildLarge(context);
    return _buildCompact(context);
  }

  Widget _buildCompact(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: AppColors.roseGoldGradient,
              borderRadius: AppSpacing.borderRadiusLg,
              boxShadow: [
                BoxShadow(
                  color: AppColors.roseGold.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              category.icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          AppSpacing.gapH8,
          SizedBox(
            width: 80,
            child: Text(
              category.name,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLarge(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppSpacing.borderRadiusLg,
          boxShadow: [
            BoxShadow(
              color: AppColors.deepPlum.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: AppSpacing.borderRadiusLg,
          child: Stack(
            children: [
              Container(
                height: 140,
                decoration: const BoxDecoration(
                  gradient: AppColors.plumGradient,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.roseGold.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: AppSpacing.borderRadiusMd,
                  ),
                  child: Icon(
                    category.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (category.beauticianCount > 0)
                      Text(
                        '${category.beauticianCount} beauticians',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
