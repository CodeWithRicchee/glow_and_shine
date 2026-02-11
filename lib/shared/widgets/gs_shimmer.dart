import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

class GSShimmer extends StatelessWidget {
  final Widget child;

  const GSShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.darkSurface : Colors.grey[300]!,
      highlightColor: isDark ? AppColors.darkCard : Colors.grey[100]!,
      child: child,
    );
  }
}

class GSShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;

  const GSShimmerBox({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GSShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.radiusMd),
        ),
      ),
    );
  }
}

class GSShimmerCard extends StatelessWidget {
  const GSShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GSShimmer(
      child: Container(
        padding: AppSpacing.paddingMd,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppSpacing.borderRadiusMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppSpacing.borderRadiusSm,
              ),
            ),
            AppSpacing.gapH12,
            Container(height: 14, width: 140, color: Colors.white),
            AppSpacing.gapH8,
            Container(height: 12, width: 100, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
