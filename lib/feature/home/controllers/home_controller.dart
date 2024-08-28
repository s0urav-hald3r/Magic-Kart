import 'package:get/get.dart' hide FormData;
import 'package:magickart/common/widgets/popup.dart';
import 'package:magickart/data/repositorys/home_repo.dart';
import 'package:magickart/feature/product/models/product_model.dart';
import 'package:magickart/utils/device_util/device_util.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    _retrieveProducts();
  }

  // Function to retrieve wishlist products from local storage
  Future<void> _retrieveProducts() async {
    // final String storeData =
    //     XLocalStorage.getData(XStorageConstant.favMods, KeyType.STR);
    // if (storeData.isNotEmpty) {
    //   // Split the storeData string by commas to get individual JSON strings
    //   final List<String> jsonStrings = storeData.split('|');

    //   // Create a list to store decoded Mod objects
    //   List<Mod> decodedMods = [];

    //   // Decode each JSON string and add the corresponding Mod object to the list
    //   for (String jsonString in jsonStrings) {
    //     Mod mod = Mod.fromJson(json.decode(jsonString));
    //     decodedMods.add(mod);
    //   }

    //   // Update favMods with the decoded Mod objects
    //   favMods = decodedMods;
    // }
  }

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  final RxList<ProductModel> _wishlistProducts = <ProductModel>[].obs;

  final RxBool _isHomeLoading = false.obs;
  final RxBool _isWishlistLoading = false.obs;
  final RxBool _isProductLoading = false.obs;

  final RxInt _page = 1.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<ProductModel> get productList => _productList;
  List<ProductModel> get wishlistProducts => _wishlistProducts;

  bool get isHomeLoading => _isHomeLoading.value;
  bool get isWishlistLoading => _isWishlistLoading.value;
  bool get isProductLoading => _isProductLoading.value;

  int get page => _page.value;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set productList(products) => _productList.value = products;
  set wishlistProducts(products) => _wishlistProducts.value = products;

  set isHomeLoading(loading) => _isHomeLoading.value = loading;
  set isWishlistLoading(loading) => _isWishlistLoading.value = loading;
  set isProductLoading(loading) => _isProductLoading.value = loading;

  set page(currentPage) => _page.value = currentPage;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  // // Function to update favorite mods in local storage
  // Future<void> _updateFavMods() async {
  //   // Encode each Mod object to JSON string
  //   List<String> jsonModStrings =
  //       favMods.map((mod) => json.encode(mod.toJson())).toList();

  //   // Join JSON strings with comma to form a single string
  //   String joinedJson = jsonModStrings.join('|');

  //   // Save the joined JSON string to local storage
  //   await XLocalStorage.addData(XStorageConstant.favMods, joinedJson);
  // }

  // // Function to toggle a mod as favorite
  // void toggleFavorite(Mod mod) {
  //   int index = favMods.indexWhere((e) => e.id == mod.id);
  //   if (index != -1) {
  //     favMods.removeWhere((e) => e.id == mod.id);
  //   } else {
  //     favMods.add(mod);
  //   }
  //   _updateFavMods();
  // }

  // Fetch products
  Future<void> getProducts() async {
    // Start Loader
    isHomeLoading = true;

    // Check for internet connectivity
    final isConnected = await TDeviceUtil.hasInternetConnection();
    if (!isConnected) {
      isHomeLoading = false;

      // Show error popup if no internet connection
      XPopup.errorSnackbar(
          title: 'Connection Error',
          message: 'Please check your internet connection.');
      return;
    }

    // API call
    productList = await HomeRepo.instance.getProducts(page);

    // Stop Loader
    isHomeLoading = false;
  }

  //  ---------------------------------* Function End *--------------------------------
}
