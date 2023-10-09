import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lichi_test/core/api/api.dart';

import '../../constants/constants.dart';
import '../models/result.dart';




class ApiRepository {
  static final _dioClient = Dio();

  static Future<ApiResult> call({
    required String methodName,
    Map<String, dynamic>? args,
  }) async {
    args ??= {};
    final String? token = API.token;
    final String requestPath = '${Constants.apiPath}$methodName';
    log('$token', name: 'TOKEN');

    args['auth'] = token ?? '';

    print('args - $args');

    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    try {
      final Response response = await _dioClient
          .post(requestPath,
          data: FormData.fromMap(args),
          options:
          Options(headers: headers, responseType: ResponseType.plain))
          .timeout(const Duration(seconds: 30),
          onTimeout: () => Response(
              requestOptions: RequestOptions(),
              statusCode: 408,
              statusMessage: ''));

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

