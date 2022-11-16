import 'package:dio/dio.dart';
import 'package:fastapi_demo/http/http_exception.dart';
import 'package:fastapi_demo/http/request_api.dart';
import 'package:fastapi_demo/typedef/function.dart';
import 'package:fastapi_demo/utils/sp_util.dart';
import 'package:fastapi_demo/utils/toast_util.dart';
import 'package:cross_connectivity/cross_connectivity.dart';

const int connectTimeOut = 10000;
const int receiveTimeOut = 10000;
const int sendTimeOut = 10000;

class HttpRequest {
  static Dio? _dio;

  static Dio createInstance([bool isJson = true]) {
    if (_dio == null) {
      var opt = BaseOptions(
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return true;
        },
        sendTimeout: sendTimeOut,
        receiveTimeout: receiveTimeOut,
        connectTimeout: connectTimeOut,
        baseUrl: RequestApi.BASE_URL,
      );
      _dio = Dio(opt);
    }

    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  static Future request<T>(
    Method method,
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = true,
    Success? success,
    Fail? fail,
  }) async {
    try {
      var connectResult = await (Connectivity().checkConnection());
      if (!connectResult) {
        ToastUtil.show('Network connection failed, please check the network');
      }
      Dio dio = createInstance(isJson);
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }

      if (SpUtil.checkAccessToken) {
        dio.options.headers['Authorization'] =
            '${SpUtil.tokenType} ${SpUtil.accessToken}';
      }

      Response response = await dio.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          method: _methodValues[method],
        ),
      );
      if (success != null) {
        success(response);
      }
    } on DioError catch (e) {
      String msg = HttpException.handleException(e);
      if (fail != null) {
        fail(msg);
      }
    }
  }
}

enum Method {
  GET,
  POST,
}

const _methodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
};
