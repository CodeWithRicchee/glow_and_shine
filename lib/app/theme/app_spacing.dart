import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Base spacing unit = 4
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  // Padding presets
  static const EdgeInsets paddingXs = EdgeInsets.all(4);
  static const EdgeInsets paddingSm = EdgeInsets.all(8);
  static const EdgeInsets paddingMd = EdgeInsets.all(16);
  static const EdgeInsets paddingLg = EdgeInsets.all(24);
  static const EdgeInsets paddingXl = EdgeInsets.all(32);

  // Horizontal padding
  static const EdgeInsets paddingHSm = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets paddingHMd = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingHLg = EdgeInsets.symmetric(horizontal: 24);

  // Vertical padding
  static const EdgeInsets paddingVSm = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets paddingVMd = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets paddingVLg = EdgeInsets.symmetric(vertical: 24);

  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets screenPaddingWithTop = EdgeInsets.fromLTRB(20, 16, 20, 0);

  // Border Radius
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusRound = 100;

  static const BorderRadius borderRadiusSm = BorderRadius.all(Radius.circular(8));
  static const BorderRadius borderRadiusMd = BorderRadius.all(Radius.circular(12));
  static const BorderRadius borderRadiusLg = BorderRadius.all(Radius.circular(16));
  static const BorderRadius borderRadiusXl = BorderRadius.all(Radius.circular(24));

  // Vertical gaps (SizedBox)
  static const SizedBox gapH4 = SizedBox(height: 4);
  static const SizedBox gapH8 = SizedBox(height: 8);
  static const SizedBox gapH12 = SizedBox(height: 12);
  static const SizedBox gapH16 = SizedBox(height: 16);
  static const SizedBox gapH20 = SizedBox(height: 20);
  static const SizedBox gapH24 = SizedBox(height: 24);
  static const SizedBox gapH32 = SizedBox(height: 32);
  static const SizedBox gapH48 = SizedBox(height: 48);

  // Horizontal gaps
  static const SizedBox gapW4 = SizedBox(width: 4);
  static const SizedBox gapW8 = SizedBox(width: 8);
  static const SizedBox gapW12 = SizedBox(width: 12);
  static const SizedBox gapW16 = SizedBox(width: 16);
  static const SizedBox gapW24 = SizedBox(width: 24);
}
