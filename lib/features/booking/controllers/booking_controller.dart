import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/models/beautician_model.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/time_slot_model.dart';

class BookingController extends GetxController {
  final currentStep = 0.obs;
  final isLoading = false.obs;
  final selectedService = Rxn<ServiceModel>();
  final selectedDate = Rxn<DateTime>();
  final selectedTimeSlot = Rxn<TimeSlotModel>();
  final selectedBeautician = Rxn<BeauticianModel>();
  final notesController = TextEditingController();
  final timeSlots = <TimeSlotModel>[].obs;
  final services = <ServiceModel>[].obs;
  final beauticians = <BeauticianModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      if (args['service'] is ServiceModel) selectedService.value = args['service'] as ServiceModel;
      if (args['beautician'] is BeauticianModel) selectedBeautician.value = args['beautician'] as BeauticianModel;
    }
    loadServices();
    loadBeauticians();
  }

  Future<void> loadServices() async {
    services.value = [
      ServiceModel(id: '1', name: 'Bridal Makeup', description: 'Complete bridal look', price: 350, durationMinutes: 120, category: 'Makeup', isPopular: true),
      ServiceModel(id: '2', name: 'Party Makeup', description: 'Glamorous party-ready look', price: 150, durationMinutes: 60, category: 'Makeup'),
      ServiceModel(id: '3', name: 'Hair Styling', description: 'Updos, curls, braids', price: 120, durationMinutes: 45, category: 'Hair'),
      ServiceModel(id: '4', name: 'Skincare Facial', description: 'Deep cleansing facial', price: 100, durationMinutes: 60, category: 'Skincare'),
      ServiceModel(id: '5', name: 'Nail Art', description: 'Custom nail designs', price: 80, durationMinutes: 45, category: 'Nails'),
      ServiceModel(id: '6', name: 'Mehndi', description: 'Traditional & modern henna', price: 200, durationMinutes: 90, category: 'Mehndi'),
    ];
  }

  Future<void> loadBeauticians() async {
    beauticians.value = [
      BeauticianModel(id: '1', name: 'Sophia Laurent', specialty: 'Bridal Makeup', imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?w=400', rating: 4.9, reviewCount: 234, experienceYears: 8, pricePerHour: 150, location: 'New York', bio: ''),
      BeauticianModel(id: '2', name: 'Emma Chen', specialty: 'Hair Stylist', imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=400', rating: 4.8, reviewCount: 189, experienceYears: 6, pricePerHour: 120, location: 'Los Angeles', bio: ''),
      BeauticianModel(id: '3', name: 'Aria Williams', specialty: 'Skincare', imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=400', rating: 4.7, reviewCount: 156, experienceYears: 10, pricePerHour: 130, location: 'Miami', bio: ''),
    ];
  }

  void generateTimeSlots(DateTime date) {
    selectedDate.value = date;
    final slots = <TimeSlotModel>[];
    for (int hour = 9; hour < 18; hour++) {
      for (int min = 0; min < 60; min += 30) {
        final start = DateTime(date.year, date.month, date.day, hour, min);
        final end = start.add(const Duration(minutes: 30));
        slots.add(TimeSlotModel(id: '${hour}_$min', startTime: start, endTime: end, isAvailable: !(hour == 12 || hour == 15), isBooked: hour == 10 && min == 30));
      }
    }
    timeSlots.value = slots;
  }

  void selectService(ServiceModel s) => selectedService.value = s;
  void selectTimeSlot(TimeSlotModel s) => selectedTimeSlot.value = s;
  void selectBeautician(BeauticianModel b) => selectedBeautician.value = b;
  void nextStep() { if (currentStep.value < 3) currentStep.value++; }
  void previousStep() { if (currentStep.value > 0) currentStep.value--; }

  bool get canProceed {
    switch (currentStep.value) {
      case 0: return selectedService.value != null;
      case 1: return selectedDate.value != null && selectedTimeSlot.value != null;
      case 2: return selectedBeautician.value != null;
      default: return true;
    }
  }

  double get totalPrice => selectedService.value?.price ?? 0;

  Future<void> confirmBooking() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offNamedUntil(AppRoutes.home, (route) => false);
    Get.snackbar('Booking Confirmed!', 'Your appointment has been booked successfully', snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFF4CAF50), colorText: const Color(0xFFFFFFFF), margin: const EdgeInsets.all(16));
  }

  @override
  void onClose() { notesController.dispose(); super.onClose(); }
}
