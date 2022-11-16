import 'package:dio/dio.dart';
import 'package:fastapi_demo/http/request.dart';
import 'package:fastapi_demo/http/request_api.dart';
import 'package:fastapi_demo/typedef/function.dart';

class RequestRepository {
  login({
    required String email,
    required String password,
    Success<Response>? success,
    Fail? fail,
  }) {
    Request.post<Response>(
      RequestApi.login,
      data: {
        'email': email,
        'password': password,
      },
      isJson: true,
      success: (response) {
        if (response.statusCode == 200) {
          success!(response);
        } else {
          fail!(response.data['detail']);
        }
      },
      fail: fail,
    );
  }

  refreshToken({
    required String refreshToken,
    Success<Response>? success,
    Fail? fail,
  }) {
    Request.post<Response>(
      RequestApi.refresh_token,
      data: {
        'refresh_token': refreshToken,
      },
      isJson: true,
      success: (response) {
        if (response.statusCode == 201) {
          success!(response);
        } else {
          fail!(response.data['detail']);
        }
      },
      fail: fail,
    );
  }
}
