import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:magickart/common/widgets/popup.dart';
import 'package:magickart/data/repositorys/home_repo.dart';
import 'package:magickart/feature/product/models/product_model.dart';
import 'package:magickart/utils/constants/enums.dart';
import 'package:magickart/utils/constants/storage_constants.dart';
import 'package:magickart/utils/device_util/device_util.dart';
import 'package:magickart/utils/local_storage/local_storage.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  @override
  void onInit() {
    getProducts();
    super.onInit();
    _retrieveProducts();
  }

  // Function to retrieve wishlist products from local storage
  Future<void> _retrieveProducts() async {
    // Start Loader
    isWishlistLoading = true;

    final String storeData =
        XLocalStorage.getData(XStorageConstant.wishlistProducts, KeyType.STR);
    if (storeData.isNotEmpty) {
      // Split the storeData string by commas to get individual JSON strings
      final List<String> jsonStrings = storeData.split('|');

      // Create a list to store decoded product objects
      List<ProductModel> decodedProducts = [];

      // Decode each JSON string and add the corresponding ProductModel object to the list
      for (String jsonString in jsonStrings) {
        ProductModel product = ProductModel.fromJson(json.decode(jsonString));
        decodedProducts.add(product);
      }

      // Update wishlistProducts with the decoded ProductModel objects
      wishlistProducts = decodedProducts;
    }

    // Stop Loader
    isWishlistLoading = false;
  }

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  final RxList<ProductModel> _wishlistProducts = <ProductModel>[].obs;

  final RxBool _isHomeLoading = false.obs;
  final RxBool _isMoreLoading = false.obs;
  final RxBool _isWishlistLoading = false.obs;

  final RxInt _page = 1.obs;

  final searchController = TextEditingController();
  final RxString _searchText = ''.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<ProductModel> get productList => searchText.isEmpty
      ? _productList
      : _productList
          .where(
              (e) => e.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
  List<ProductModel> get wishlistProducts => _wishlistProducts;

  bool get isHomeLoading => _isHomeLoading.value;
  bool get isMoreLoading => _isMoreLoading.value;
  bool get isWishlistLoading => _isWishlistLoading.value;

  int get page => _page.value;

  String get searchText => _searchText.value;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set productList(products) => _productList.value = products;
  set wishlistProducts(products) => _wishlistProducts.value = products;

  set isHomeLoading(loading) => _isHomeLoading.value = loading;
  set isMoreLoading(loading) => _isMoreLoading.value = loading;
  set isWishlistLoading(loading) => _isWishlistLoading.value = loading;

  set page(currentPage) => _page.value = currentPage;

  set searchText(text) => _searchText.value = text;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  // Function to update favorite products in local storage
  Future<void> _updateFavouriteProduct() async {
    // Encode each product object to JSON string
    List<String> jsonModStrings = wishlistProducts
        .map((product) => json.encode(product.toJson()))
        .toList();

    // Join JSON strings with comma to form a single string
    String joinedJson = jsonModStrings.join('|');

    // Save the joined JSON string to local storage
    await XLocalStorage.addData(XStorageConstant.wishlistProducts, joinedJson);
  }

  // Function to toggle a product as favorite
  void toggleFavoriteProduct(ProductModel product) {
    int index = wishlistProducts.indexWhere((e) => e.id == product.id);
    if (index != -1) {
      wishlistProducts.removeWhere((e) => e.id == product.id);
    } else {
      wishlistProducts.add(product);
    }
    _updateFavouriteProduct();
  }

  // Fetch products
  Future<void> getProducts({bool fetchMore = false}) async {
    // Start Loader
    fetchMore ? isMoreLoading = true : isHomeLoading = true;

    // Check for internet connectivity
    final isConnected = await TDeviceUtil.hasInternetConnection();
    if (!isConnected) {
      fetchMore ? isMoreLoading = false : isHomeLoading = false;

      // Show error popup if no internet connection
      XPopup.errorSnackbar(
          title: 'Connection Error',
          message: 'Please check your internet connection.');
      return;
    }

    // API call
    productList = await HomeRepo.instance.getProducts(page);

    // Stop Loader
    fetchMore ? isMoreLoading = false : isHomeLoading = false;
  }

  //  ---------------------------------* Function End *--------------------------------
}
