class ApiResult<T> {
  bool status;
  T? data;

  ApiResult({required this.status, this.data});

  static ApiResult complete(Map<String, dynamic> responseData) {
    return ApiResult(status: true, data: responseData);
  }

  static error() {
    return ApiResult(status: false);
  }
}
