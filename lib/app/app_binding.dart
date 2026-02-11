import 'package:get/get.dart';
import '../data/providers/api_provider.dart';
import '../data/providers/local_storage_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LocalStorageProvider(), permanent: true);
    Get.put(ApiProvider(), permanent: true);
  }
}
