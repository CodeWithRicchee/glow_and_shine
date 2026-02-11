import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Palette
  static const Color roseGold = Color(0xFFB76E79);
  static const Color deepPlum = Color(0xFF2D1B2E);
  static const Color softPink = Color(0xFFF8E8EE);
  static const Color champagne = Color(0xFFF7E7CE);

  // Extended Palette
  static const Color roseGoldLight = Color(0xFFD4A0A7);
  static const Color roseGoldDark = Color(0xFF8E4A55);
  static const Color plumLight = Color(0xFF4A2E4C);
  static const Color blush = Color(0xFFFDF2F8);
  static const Color ivory = Color(0xFFFFFBF5);
  static const Color warmGrey = Color(0xFF6B5B5E);
  static const Color coolGrey = Color(0xFF9E8E91);

  // Functional Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF2196F3);

  // Light Theme
  static const Color lightBackground = Color(0xFFFFFBF8);
  static const Color lightSurface = Colors.white;
  static const Color lightCard = Colors.white;
  static const Color lightText = Color(0xFF2D1B2E);
  static const Color lightTextSecondary = Color(0xFF6B5B5E);
  static const Color lightDivider = Color(0xFFEDE5E8);

  // Dark Theme
  static const Color darkBackground = Color(0xFF1A1A2E);
  static const Color darkSurface = Color(0xFF232340);
  static const Color darkCard = Color(0xFF2A2A48);
  static const Color darkText = Color(0xFFF8E8EE);
  static const Color darkTextSecondary = Color(0xFFB0A0B3);
  static const Color darkDivider = Color(0xFF3A3A58);

  // Gradients
  static const LinearGradient roseGoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB76E79), Color(0xFFD4A0A7)],
  );

  static const LinearGradient plumGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2D1B2E), Color(0xFF4A2E4C)],
  );

  static const LinearGradient champagneGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF7E7CE), Color(0xFFFDF2F8)],
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF8E8EE), Color(0xFFFFFFFF), Color(0xFFF8E8EE)],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xCC2D1B2E)],
  );
}
