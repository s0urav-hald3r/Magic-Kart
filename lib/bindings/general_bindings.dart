import 'package:get/get.dart';
import 'package:magickart/common/controllers/navigation_bar_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // To change screen via bottom navigation bar
    Get.lazyPut(() => NavigationBarController());
  }
}
