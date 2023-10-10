import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../models/result.dart';

/* TODO:
      реквесты ТЗ
    Url: https://api.lichi.com/category/get_category_product_list
    Query Params: (Post form-data)
    -	shop: 2;
    -	lang: 1;
    -	category: name;    (new, last, dresses, shoes - на выбор)
    -	limit: 12; (ограничение количества товаров)
    -	page: 1;  (для пагинации, если требуется)
    2.2 Получение информации о товаре по идентификатору
    Url: https://api.lichi.com/product/get_product_detail
    Query Params: (Post form-data)
    -	shop: 2;
    -	lang: 1;
    -	id: айди товара;
 */

class ApiController {
  static final _dioClient = Dio();

  static Future<ApiResult> call({
    required String methodName,
    Map<String, dynamic>? args,
  }) async {
    args ??= {};
    final String requestPath = '${Constants.apiPath}$methodName';

    // print('args - $args');

    try {
      final Response response = await _dioClient
          .post(requestPath,
              data: args, options: Options(responseType: ResponseType.plain))
          .timeout(
            const Duration(seconds: 30),
          );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data);
        return ApiResult.complete(responseData);
      }

      return ApiResult.error();
    } on Object catch (e) {
      log(e.toString(), name: 'call');
      return ApiResult.error();
    }
  }
}
