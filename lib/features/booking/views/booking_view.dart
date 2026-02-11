import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_beautician_card.dart';
import '../../../shared/widgets/gs_button.dart';
import '../../../shared/widgets/gs_service_card.dart';
import '../../../shared/widgets/gs_text_field.dart';
import '../../../shared/widgets/gs_time_slot_chip.dart';
import '../../../utils/formatters.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Iconsax.arrow_left), onPressed: () { if (controller.currentStep.value > 0) controller.previousStep(); else Get.back(); }),
        title: Text('Book Appointment', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
      ),
      body: Column(children: [
        _stepper(),
        Expanded(child: Obx(() { switch (controller.currentStep.value) { case 0: return _serviceStep(); case 1: return _dateTimeStep(); case 2: return _beauticianStep(); case 3: return _confirmStep(); default: return const SizedBox.shrink(); } })),
        _bottomBar(),
      ]),
    );
  }

  Widget _stepper() {
    final steps = ['Service', 'Date', 'Artist', 'Confirm'];
    return Obx(() => Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), child: Row(children: List.generate(steps.length, (i) {
      final isActive = i <= controller.currentStep.value;
      final isCurrent = i == controller.currentStep.value;
      return Expanded(child: Row(children: [
        Container(width: 28, height: 28, decoration: BoxDecoration(shape: BoxShape.circle, color: isActive ? AppColors.roseGold : AppColors.softPink),
          child: Center(child: isActive && !isCurrent ? const Icon(Icons.check, size: 16, color: Colors.white) : Text('${i + 1}', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: isActive ? Colors.white : AppColors.coolGrey)))),
        if (i < steps.length - 1) Expanded(child: Container(height: 2, color: i < controller.currentStep.value ? AppColors.roseGold : AppColors.lightDivider)),
      ]));
    }))));
  }

  Widget _serviceStep() => Obx(() => ListView.separated(padding: AppSpacing.screenPadding, itemCount: controller.services.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
    itemBuilder: (_, i) => Obx(() => GSServiceCard(service: controller.services[i], selected: controller.selectedService.value?.id == controller.services[i].id, onTap: () => controller.selectService(controller.services[i]))).animate().fadeIn(delay: Duration(milliseconds: 60 * i), duration: 300.ms)));

  Widget _dateTimeStep() => SingleChildScrollView(padding: AppSpacing.screenPadding, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Select Date', style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.w600)),
    AppSpacing.gapH12,
    Obx(() => TableCalendar(firstDay: DateTime.now(), lastDay: DateTime.now().add(const Duration(days: 90)), focusedDay: controller.selectedDate.value ?? DateTime.now(), selectedDayPredicate: (day) => isSameDay(controller.selectedDate.value, day), onDaySelected: (selected, _) => controller.generateTimeSlots(selected),
      calendarStyle: CalendarStyle(selectedDecoration: const BoxDecoration(color: AppColors.roseGold, shape: BoxShape.circle), todayDecoration: BoxDecoration(color: AppColors.roseGold.withValues(alpha: 0.3), shape: BoxShape.circle)),
      headerStyle: HeaderStyle(titleTextStyle: GoogleFonts.playfairDisplay(fontSize: 16, fontWeight: FontWeight.w600), formatButtonVisible: false))),
    AppSpacing.gapH24,
    Obx(() { if (controller.timeSlots.isEmpty) return const SizedBox.shrink(); return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Select Time', style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.w600)), AppSpacing.gapH12,
      Wrap(spacing: 8, runSpacing: 8, children: controller.timeSlots.map((s) => Obx(() => GSTimeSlotChip(slot: s, isSelected: controller.selectedTimeSlot.value?.id == s.id, onTap: () => controller.selectTimeSlot(s)))).toList()),
    ]).animate().fadeIn(duration: 400.ms); }),
  ]));

  Widget _beauticianStep() => Obx(() => ListView.separated(padding: AppSpacing.screenPadding, itemCount: controller.beauticians.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
    itemBuilder: (_, i) { final b = controller.beauticians[i]; return Obx(() => Container(
      decoration: BoxDecoration(border: controller.selectedBeautician.value?.id == b.id ? Border.all(color: AppColors.roseGold, width: 2) : null, borderRadius: AppSpacing.borderRadiusMd),
      child: GSBeauticianCard(beautician: b, compact: true, onTap: () => controller.selectBeautician(b)),
    )).animate().fadeIn(delay: Duration(milliseconds: 80 * i), duration: 300.ms); }));

  Widget _confirmStep() => SingleChildScrollView(padding: AppSpacing.screenPadding, child: Obx(() {
    final s = controller.selectedService.value; final b = controller.selectedBeautician.value; final d = controller.selectedDate.value; final t = controller.selectedTimeSlot.value;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Booking Summary', style: GoogleFonts.playfairDisplay(fontSize: 22, fontWeight: FontWeight.bold)), AppSpacing.gapH24,
      _row('Service', s?.name ?? ''), _row('Duration', s != null ? Formatters.duration(s.durationMinutes) : ''), _row('Date', d != null ? Formatters.date(d) : ''), _row('Time', t?.formattedTime ?? ''), _row('Beautician', b?.name ?? ''), _row('Location', b?.location ?? ''),
      AppSpacing.gapH16, const Divider(), AppSpacing.gapH16,
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)), Text(Formatters.currency(controller.totalPrice), style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.roseGold))]),
      AppSpacing.gapH24, GSTextField(label: 'Special Notes (Optional)', hint: 'Any special requests...', controller: controller.notesController, maxLines: 3),
    ]).animate().fadeIn(duration: 400.ms);
  }));

  Widget _row(String label, String value) => Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.coolGrey)), Text(value, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500))]));

  Widget _bottomBar() => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Get.theme.scaffoldBackgroundColor, boxShadow: [BoxShadow(color: AppColors.deepPlum.withValues(alpha: 0.08), blurRadius: 20, offset: const Offset(0, -4))]),
    child: Obx(() => GSGradientButton(text: controller.currentStep.value == 3 ? 'Confirm Booking' : 'Continue', isLoading: controller.isLoading.value,
      onPressed: controller.canProceed ? () { if (controller.currentStep.value == 3) controller.confirmBooking(); else controller.nextStep(); } : null)));
}
