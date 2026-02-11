import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/providers/local_storage_provider.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final pages = [
    OnboardingPage(title: 'Discover Top Beauticians', subtitle: 'Find the perfect beauty professional for every event - from weddings to everyday glam', icon: Icons.search_rounded),
    OnboardingPage(title: 'Book with Ease', subtitle: 'Schedule appointments in seconds with our seamless booking experience', icon: Icons.calendar_month_rounded),
    OnboardingPage(title: 'Look Your Best', subtitle: 'Get stunning looks from verified professionals who come to you', icon: Icons.auto_awesome),
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      completeOnboarding();
    }
  }

  void completeOnboarding() {
    Get.find<LocalStorageProvider>().setOnboardingSeen();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final IconData icon;
  OnboardingPage({required this.title, required this.subtitle, required this.icon});
}
