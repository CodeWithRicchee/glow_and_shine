import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

class AppDecorations {
  AppDecorations._();

  // Card Shadows
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: AppColors.deepPlum.withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: AppColors.deepPlum.withValues(alpha: 0.1),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get roseGoldGlow => [
    BoxShadow(
      color: AppColors.roseGold.withValues(alpha: 0.3),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  // Card Decorations
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: AppSpacing.borderRadiusMd,
    boxShadow: softShadow,
  );

  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: AppSpacing.borderRadiusLg,
    boxShadow: mediumShadow,
  );

  // Glassmorphism
  static BoxDecoration glassmorphism({
    Color? color,
    double opacity = 0.15,
    double blur = 10,
  }) => BoxDecoration(
    color: (color ?? Colors.white).withValues(alpha: opacity),
    borderRadius: AppSpacing.borderRadiusLg,
    border: Border.all(
      color: Colors.white.withValues(alpha: 0.2),
    ),
  );

  static Widget glassmorphicContainer({
    required Widget child,
    EdgeInsets? padding,
    double opacity = 0.15,
  }) {
    return ClipRRect(
      borderRadius: AppSpacing.borderRadiusLg,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding ?? AppSpacing.paddingMd,
          decoration: glassmorphism(opacity: opacity),
          child: child,
        ),
      ),
    );
  }

  // Gradient Decorations
  static BoxDecoration get roseGoldGradientDecoration => const BoxDecoration(
    gradient: AppColors.roseGoldGradient,
    borderRadius: AppSpacing.borderRadiusMd,
  );

  static BoxDecoration get plumGradientDecoration => const BoxDecoration(
    gradient: AppColors.plumGradient,
    borderRadius: AppSpacing.borderRadiusMd,
  );

  // Input Decoration
  static InputDecoration inputDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.softPink.withValues(alpha: 0.3),
      border: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusMd,
        borderSide: const BorderSide(color: AppColors.roseGold, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusMd,
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
