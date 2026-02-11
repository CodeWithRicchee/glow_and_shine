import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../data/models/time_slot_model.dart';

class GSTimeSlotChip extends StatelessWidget {
  final TimeSlotModel slot;
  final bool isSelected;
  final VoidCallback? onTap;

  const GSTimeSlotChip({
    super.key,
    required this.slot,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = !slot.isAvailable || slot.isBooked;

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.coolGrey.withValues(alpha: 0.1)
              : isSelected
                  ? AppColors.roseGold
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDisabled
                ? AppColors.coolGrey.withValues(alpha: 0.2)
                : isSelected
                    ? AppColors.roseGold
                    : AppColors.coolGrey.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          slot.formattedTime,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isDisabled
                ? AppColors.coolGrey.withValues(alpha: 0.4)
                : isSelected
                    ? Colors.white
                    : AppColors.deepPlum,
          ),
        ),
      ),
    );
  }
}
