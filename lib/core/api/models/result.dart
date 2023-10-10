class ApiResult<T> {
  bool status;
  String? message;
  T? data;

  ApiResult({required this.status, this.message, this.data});

  static ApiResult complete(Map<String, dynamic> responseData) {
    return ApiResult(
        status: true,
        message: responseData["message"],
        data: responseData["data"]);
  }

  static error() {
    return ApiResult(status: false);
  }
}
