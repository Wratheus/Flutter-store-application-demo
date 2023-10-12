import '../../../../core/api/controller/api_controller.dart';
import '../../../../core/api/models/result.dart';
import '../../product/models/product.dart';

class CatalogRequests {
  static Future<ApiResult<dynamic>> getCategoryProductList(
      {required final String category}) async {
    const String path = "category/get_category_product_list";
    final Map<String, dynamic> args = {
      "shop": 2,
      "lang": 1,
      "category": category,
      "limit": 12,
      "page": 1
    };
    ApiResult res = await ApiController.call(methodName: path, args: args);

    List<Product> getCategoryProductList = [];
    if (res.status == true) {
      res.data["api_data"]["aProduct"].forEach((productJson) {
        Product prod = Product.fromJson(productJson);
        getCategoryProductList.add(prod);
      });
      res.data = getCategoryProductList;
    }
    return res;
  }
}
