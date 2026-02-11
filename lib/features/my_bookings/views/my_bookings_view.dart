import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../shared/widgets/gs_booking_card.dart';
import '../../../shared/widgets/gs_empty_state.dart';
import '../../../shared/widgets/gs_shimmer.dart';
import '../controllers/my_bookings_controller.dart';

class MyBookingsView extends GetView<MyBookingsController> {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MyBookingsController>()) Get.put(MyBookingsController());
    final c = Get.find<MyBookingsController>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Bookings', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: false,
          bottom: TabBar(labelColor: AppColors.roseGold, unselectedLabelColor: AppColors.coolGrey, indicatorColor: AppColors.roseGold, labelStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600), tabs: const [Tab(text: 'Upcoming'), Tab(text: 'Past'), Tab(text: 'Cancelled')]),
        ),
        body: Obx(() {
          if (c.isLoading.value) return Padding(padding: AppSpacing.screenPadding, child: Column(children: List.generate(3, (_) => const Padding(padding: EdgeInsets.only(top: 12), child: GSShimmerBox(height: 140)))));
          return TabBarView(children: [
            _bookingList(c.upcomingBookings, c, 'No upcoming bookings', 'Your scheduled appointments will appear here', Iconsax.calendar),
            _bookingList(c.pastBookings, null, 'No past bookings', 'Your completed appointments will appear here', Iconsax.clock),
            _bookingList(c.cancelledBookings, null, 'No cancellations', 'Your cancelled appointments will appear here', Iconsax.close_circle),
          ]);
        }),
      ),
    );
  }

  Widget _bookingList(List bookings, MyBookingsController? cc, String emptyTitle, String emptySub, IconData emptyIcon) {
    if (bookings.isEmpty) return GSEmptyState(icon: emptyIcon, title: emptyTitle, subtitle: emptySub);
    return ListView.separated(padding: const EdgeInsets.all(20), itemCount: bookings.length, separatorBuilder: (_, __) => AppSpacing.gapH12,
      itemBuilder: (_, i) => GSBookingCard(booking: bookings[i], onCancel: cc != null ? () => cc.cancelBooking(bookings[i].id) : null).animate().fadeIn(delay: Duration(milliseconds: 80 * i), duration: 300.ms).slideY(begin: 0.05, end: 0, delay: Duration(milliseconds: 80 * i), duration: 300.ms));
  }
}
