import 'package:flutter_test/flutter_test.dart';
import 'package:magickart/feature/home/controllers/home_controller.dart';

void main() {
  group('home controller ...', () {
    late HomeController homeController;

    // this function called before each & every test function
    setUp(() {
      homeController = HomeController();
    });

    test('''
    given home controller class
    when class is instantiated
    then the value of page number should be 1
    ''', () {
      expect(homeController.page, 1);
    });

    test('''
    given home controller class
    when class is instantiated
    then the value of loader should be false (isHomeLoading, isMoreLoading, isWishlistLoading)
    ''', () {
      expect(homeController.isHomeLoading, false);
      expect(homeController.isMoreLoading, false);
      expect(homeController.isWishlistLoading, false);
    });
  });
}
