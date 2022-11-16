import 'package:dio/dio.dart';

class HttpException {
  static String handleException(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return "Require cancel";
      case DioErrorType.connectTimeout:
        return "Connect timeout";
      case DioErrorType.sendTimeout:
        return "Send timeout";
      case DioErrorType.receiveTimeout:
        return "Receive timeout";
      case DioErrorType.response:
        return "Response incorrect";
      case DioErrorType.other:
        return "Other";
      default:
        return "Unknown";
    }
  }
}
