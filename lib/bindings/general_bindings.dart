import 'package:get/get.dart';
import 'package:magickart/common/controllers/navigation_bar_controller.dart';
import 'package:magickart/data/repositorys/home_repo.dart';
import 'package:magickart/feature/home/controllers/home_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // To change screen via bottom navigation bar
    Get.lazyPut(() => NavigationBarController());

    // Home page controllers
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeRepo());
  }
}
