import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/beautician_model.dart';
import '../../../data/models/review_model.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/portfolio_item_model.dart';
import '../../../data/models/availability_model.dart';

class BeauticianController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final isLoading = true.obs;
  final beautician = Rxn<BeauticianModel>();
  final services = <ServiceModel>[].obs;
  final reviews = <ReviewModel>[].obs;
  final portfolio = <PortfolioItemModel>[].obs;
  final availability = <AvailabilityModel>[].obs;
  final isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    if (Get.arguments is BeauticianModel) {
      beautician.value = Get.arguments as BeauticianModel;
    }
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    services.value = [
      ServiceModel(id: '1', name: 'Bridal Makeup', description: 'Complete bridal look with HD makeup', price: 350, durationMinutes: 120, category: 'Makeup', isPopular: true),
      ServiceModel(id: '2', name: 'Party Makeup', description: 'Glamorous party-ready look', price: 150, durationMinutes: 60, category: 'Makeup'),
      ServiceModel(id: '3', name: 'Hair Styling', description: 'Updos, curls, braids', price: 120, durationMinutes: 45, category: 'Hair'),
      ServiceModel(id: '4', name: 'Skincare Facial', description: 'Deep cleansing pre-event facial', price: 100, durationMinutes: 60, category: 'Skincare'),
      ServiceModel(id: '5', name: 'Nail Art', description: 'Custom nail designs', price: 80, durationMinutes: 45, category: 'Nails'),
    ];
    reviews.value = [
      ReviewModel(id: '1', userId: 'u1', userName: 'Sarah M.', beauticianId: beautician.value?.id ?? '', rating: 5.0, comment: 'Absolutely stunning bridal makeup! She made me feel like a queen.', createdAt: DateTime.now().subtract(const Duration(days: 3)), serviceName: 'Bridal Makeup'),
      ReviewModel(id: '2', userId: 'u2', userName: 'Jennifer L.', beauticianId: beautician.value?.id ?? '', rating: 4.8, comment: 'Great attention to detail. My hair looked amazing all evening.', createdAt: DateTime.now().subtract(const Duration(days: 7)), serviceName: 'Hair Styling'),
      ReviewModel(id: '3', userId: 'u3', userName: 'Maria K.', beauticianId: beautician.value?.id ?? '', rating: 4.5, comment: 'Wonderful experience! The party look was exactly what I wanted.', createdAt: DateTime.now().subtract(const Duration(days: 14)), serviceName: 'Party Makeup'),
    ];
    portfolio.value = List.generate(9, (i) => PortfolioItemModel(id: 'p$i', imageUrl: 'https://picsum.photos/seed/port$i/300/400', title: 'Look ${i + 1}', eventType: ['Wedding', 'Fashion', 'Corporate'][i % 3]));
    availability.value = [
      AvailabilityModel(dayOfWeek: 1, startTime: '09:00', endTime: '18:00'),
      AvailabilityModel(dayOfWeek: 2, startTime: '09:00', endTime: '18:00'),
      AvailabilityModel(dayOfWeek: 3, startTime: '09:00', endTime: '18:00'),
      AvailabilityModel(dayOfWeek: 4, startTime: '09:00', endTime: '18:00'),
      AvailabilityModel(dayOfWeek: 5, startTime: '09:00', endTime: '18:00'),
      AvailabilityModel(dayOfWeek: 6, startTime: '10:00', endTime: '16:00'),
      AvailabilityModel(dayOfWeek: 7, startTime: '00:00', endTime: '00:00', isAvailable: false),
    ];
    isLoading.value = false;
  }

  void toggleFavorite() => isFavorite.toggle();

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
