import 'package:fastapi_demo/ui/page/login/login_controller.dart';
import 'package:fastapi_demo/ui/page/login/widget/email_login.dart';
import 'package:fastapi_demo/ui/page/login/widget/login_button.dart';
import 'package:fastapi_demo/ui/page/login/widget/login_function.dart';
import 'package:fastapi_demo/widget/box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: loginBox(
        children: [
          loginTitle(),
          loginInputArea(
            children: [
              EmailLogin(controller: controller),
              vBox(28),
              LoginButton(
                onTap: controller.login,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
