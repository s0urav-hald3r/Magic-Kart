import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:magickart/feature/product/models/product_model.dart';
import 'package:magickart/utils/constants/endpoints.dart';

import '../services/dio_client.dart';

class HomeRepo extends GetxController {
  static HomeRepo get instance => Get.find();
  final DioClient _dioClient = DioClient();

  //  ---------------------------------* Function Start *------------------------------

  // Get products
  Future<List<ProductModel>> getProducts(int page) async {
    int limit = 5 * page;
    List<ProductModel> tempList = [];

    Response response = await _dioClient.get('${XEndpoint.getProducts}$limit');
    List<dynamic> jsonBody = response.data as List<dynamic>;

    for (var i = 0; i < jsonBody.length; i++) {
      tempList.add(ProductModel.fromJson(jsonBody[i]));
    }

    return tempList.isEmpty ? [] : tempList;
  }

  //  ---------------------------------* Function End *--------------------------------
}
