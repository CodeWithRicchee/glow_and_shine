import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../data/models/service_model.dart';
import '../../utils/formatters.dart';

class GSServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onTap;
  final bool selected;

  const GSServiceCard({
    super.key,
    required this.service,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.roseGold.withValues(alpha: 0.1)
              : Theme.of(context).cardColor,
          borderRadius: AppSpacing.borderRadiusMd,
          border: Border.all(
            color: selected ? AppColors.roseGold : Colors.transparent,
            width: 1.5,
          ),
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
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.softPink,
                borderRadius: AppSpacing.borderRadiusSm,
              ),
              child: const Icon(Iconsax.brush_1, color: AppColors.roseGold),
            ),
            AppSpacing.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.gapH4,
                  Text(
                    '${Formatters.duration(service.durationMinutes)} • ${service.category}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.coolGrey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              Formatters.currency(service.price),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.roseGold,
              ),
            ),
            if (selected) ...[
              AppSpacing.gapW8,
              const Icon(Iconsax.tick_circle5, color: AppColors.roseGold, size: 22),
            ],
          ],
        ),
      ),
    );
  }
}
