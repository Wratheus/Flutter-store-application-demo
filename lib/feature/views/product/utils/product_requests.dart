import '../../../../core/api/controller/api_controller.dart';
import '../../../../core/api/models/result.dart';
import '../models/product.dart';

class ProductRequests {
  static Future<ApiResult> getProductDetail({required int productId}) async {
    const String path = "product/get_product_detail";
    final Map<String, dynamic> args = {"shop": 2, "lang": 1, "id": productId};
    ApiResult res = await ApiController.call(methodName: path, args: args);

    if (res.status == true) {
      Product product = Product.fromJson(res.data["api_data"]["aData"]);
      res.data = product;
    }
    return res;
  }
}
