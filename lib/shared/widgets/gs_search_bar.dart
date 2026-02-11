import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'package:google_fonts/google_fonts.dart';

class GSSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final VoidCallback? onFilterTap;

  const GSSearchBar({
    super.key,
    this.controller,
    this.hint = 'Search beauticians, services...',
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : Colors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: AppColors.deepPlum.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        style: GoogleFonts.poppins(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.coolGrey,
          ),
          prefixIcon: const Icon(Iconsax.search_normal, size: 20, color: AppColors.coolGrey),
          suffixIcon: onFilterTap != null
              ? IconButton(
                  onPressed: onFilterTap,
                  icon: const Icon(Iconsax.setting_4, size: 20, color: AppColors.roseGold),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
