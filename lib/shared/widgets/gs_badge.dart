import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GSBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final bool small;

  const GSBadge({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.small = false,
  });

  factory GSBadge.status(String status) {
    Color bg;
    Color fg;
    switch (status.toLowerCase()) {
      case 'confirmed':
        bg = AppColors.success.withValues(alpha: 0.15);
        fg = AppColors.success;
        break;
      case 'pending':
        bg = AppColors.warning.withValues(alpha: 0.15);
        fg = AppColors.warning;
        break;
      case 'cancelled':
        bg = AppColors.error.withValues(alpha: 0.15);
        fg = AppColors.error;
        break;
      case 'completed':
        bg = AppColors.info.withValues(alpha: 0.15);
        fg = AppColors.info;
        break;
      default:
        bg = AppColors.softPink;
        fg = AppColors.roseGold;
    }
    return GSBadge(text: status, color: bg, textColor: fg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 10,
        vertical: small ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.softPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: small ? 9 : 11,
          fontWeight: FontWeight.w600,
          color: textColor ?? AppColors.roseGold,
        ),
      ),
    );
  }
}
