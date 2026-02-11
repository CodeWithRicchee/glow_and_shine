import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../data/providers/local_storage_provider.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final storage = Get.find<LocalStorageProvider>();
      if (!storage.hasSeenOnboarding) {
        Get.offAllNamed(AppRoutes.onboarding);
      } else if (storage.isLoggedIn) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      // Fallback: go to onboarding if storage fails
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }
}
