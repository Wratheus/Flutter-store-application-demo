import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../models/result.dart';

class ApiController {
  static final _dioClient = Dio();

  static Future<ApiResult> call({
    required String methodName,
    Map<String, dynamic>? args,
  }) async {
    args ??= {};
    final String requestPath = '${Constants.apiPath}$methodName';


    try {
      final Response response = await _dioClient
          .post(requestPath,
              data: args, options: Options(responseType: ResponseType.plain))
          .timeout(
            const Duration(seconds: 30),
          );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.data);
        return ApiResult.complete(responseData);
      }

      return ApiResult.error();
    } on Object catch (e) {
      log(e.toString(), name: 'call');
      return ApiResult.error();
    }
  }
}
