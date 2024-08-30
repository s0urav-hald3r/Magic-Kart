import 'package:flutter_test/flutter_test.dart';
import 'package:magickart/data/repositorys/home_repo.dart';
import 'package:magickart/feature/product/models/product_model.dart';

void main() {
  group('home repo ...', () {
    late HomeRepo homeRepo;

    // this function called before each & every test function
    setUp(() {
      homeRepo = HomeRepo();
    });

    test('''
    given home repo class
    when getProducts function called 
    then a list of product model should be returned 
    ''', () async {
      final productList = await homeRepo.getProducts(1);
      expect(productList, isA<List<ProductModel>>());
    });
  });
}
