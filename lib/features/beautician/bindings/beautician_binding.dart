import 'package:get/get.dart';
import '../controllers/beautician_controller.dart';

class BeauticianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeauticianController>(() => BeauticianController());
  }
}
