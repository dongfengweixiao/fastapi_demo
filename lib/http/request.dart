import 'package:fastapi_demo/http/http_request.dart';
import 'package:fastapi_demo/typedef/function.dart';

class Request {
  static void post<T>(
    String path, {
    Map<String, dynamic>? parames,
    dynamic data,
    String? baseUrl,
    bool isJson = true,
    Success<T>? success,
    Fail? fail,
    bool dialog = true,
  }) {
    _request(
      Method.POST,
      path,
      data: data,
      params: parames,
      baseUrl: baseUrl,
      isJson: isJson,
      success: success,
      fail: fail,
      dialog: dialog,
    );
  }

  static void _request<T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = true,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    /// Todo： dialog
    HttpRequest.request(
      method,
      path,
      params: params,
      data: data,
      baseUrl: baseUrl,
      isJson: isJson,
      success: (response) {
        if (dialog) {
          /// Todo：dialog
        }
        success!(response);
      },
      fail: ((msg) {}),
    );
  }
}
