import '../../../../core/api/controller/api_controller.dart';
import '../../../../core/api/models/result.dart';
import '../../product/models/product.dart';

class CatalogRequests {
  static Future<ApiResult> getCategoryProductList(
      {required final String category, int page = 1}) async {
    const String path = "category/get_category_product_list";
    final Map<String, dynamic> args = {
      "shop": 2,
      "lang": 1,
      "category": category,
      "limit": 12,
      "page": page
    };
    ApiResult res = await ApiController.call(methodName: path, args: args);
    int maxPages = 0;
    List<Product> getCategoryProductList = [];
    Map<String, dynamic> result = {"maxPages": maxPages, "products": getCategoryProductList};
    if (res.status == true) {
      result["maxPages"] = res.data["api_data"]["iPages"];
      res.data["api_data"]["aProduct"].forEach((productJson) {
        Product prod = Product.fromJson(productJson);
        result["products"].add(prod);
      });
      res.data = result;
    }
    return res;
  }
}
