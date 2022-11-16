import 'package:dio/dio.dart';
import 'package:fastapi_demo/base/controllers/base_get_controller.dart';
import 'package:fastapi_demo/utils/sp_util.dart';
import 'package:fastapi_demo/utils/string_util.dart';
import 'package:fastapi_demo/utils/toast_util.dart';
import 'package:flutter/material.dart';

class LoginController extends BaseGetController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ToastUtil.show("Please input email or password");
      return;
    }
    if (email.isValidEmail()) {
      repository.login(
        email: email,
        password: password,
        success: (resp) {
          intentPage(resp);
        },
        fail: (msg) {
          ToastUtil.show(msg);
        },
      );
    } else {
      ToastUtil.show('Incorrect email address');
    }
  }

  void intentPage(Response resp) {
    var data = resp.data['data'];
    SpUtil.accessToken = data["access_token"];
    SpUtil.refreshToken = data["refresh_token"];
    SpUtil.tokenType = data["token_type"];

    ToastUtil.show('Login success');
    // Get.offAllNamed(Routes.index);
  }
}
