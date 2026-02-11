import 'package:get/get.dart';
import '../../../data/models/booking_model.dart';

class MyBookingsController extends GetxController {
  final isLoading = true.obs;
  final upcomingBookings = <BookingModel>[].obs;
  final pastBookings = <BookingModel>[].obs;
  final cancelledBookings = <BookingModel>[].obs;

  @override
  void onInit() { super.onInit(); loadBookings(); }

  Future<void> loadBookings() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    upcomingBookings.value = [
      BookingModel(id: 'b1', userId: 'u1', beauticianId: '1', beauticianName: 'Sophia Laurent', beauticianImage: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400', serviceName: 'Bridal Makeup', totalPrice: 350, dateTime: DateTime.now().add(const Duration(days: 3)), durationMinutes: 120, status: 'confirmed', eventType: 'Wedding'),
      BookingModel(id: 'b2', userId: 'u1', beauticianId: '2', beauticianName: 'Emma Chen', beauticianImage: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=400', serviceName: 'Hair Styling', totalPrice: 120, dateTime: DateTime.now().add(const Duration(days: 7)), durationMinutes: 60, status: 'pending', eventType: 'Corporate'),
    ];
    pastBookings.value = [
      BookingModel(id: 'b3', userId: 'u1', beauticianId: '3', beauticianName: 'Aria Williams', beauticianImage: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=400', serviceName: 'Skincare Facial', totalPrice: 100, dateTime: DateTime.now().subtract(const Duration(days: 5)), durationMinutes: 60, status: 'completed'),
    ];
    cancelledBookings.value = [
      BookingModel(id: 'b4', userId: 'u1', beauticianId: '4', beauticianName: 'Isabella Rose', beauticianImage: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400', serviceName: 'Nail Art', totalPrice: 80, dateTime: DateTime.now().subtract(const Duration(days: 2)), durationMinutes: 45, status: 'cancelled'),
    ];
    isLoading.value = false;
  }

  void cancelBooking(String bookingId) {
    final booking = upcomingBookings.firstWhereOrNull((b) => b.id == bookingId);
    if (booking != null) {
      upcomingBookings.remove(booking);
      cancelledBookings.add(BookingModel(id: booking.id, userId: booking.userId, beauticianId: booking.beauticianId, beauticianName: booking.beauticianName, beauticianImage: booking.beauticianImage, serviceName: booking.serviceName, totalPrice: booking.totalPrice, dateTime: booking.dateTime, durationMinutes: booking.durationMinutes, status: 'cancelled'));
    }
  }
}
