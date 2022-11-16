import 'package:fastapi_demo/ui/page/login/login_controller.dart';
import 'package:fastapi_demo/widget/box.dart';
import 'package:fastapi_demo/widget/text_edit.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatelessWidget {
  const EmailLogin({
    super.key,
    required this.controller,
  });
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _emailInput(),
        vBox(12),
        _passwordInput(),
      ],
    );
  }

  _emailInput() {
    return TextEditeWidget(
      hintText: 'Email',
      controller: controller.emailController,
    );
  }

  _passwordInput() {
    return TextEditeWidget(
      hintText: 'Password',
      controller: controller.passwordController,
      obscureText: true,
    );
  }
}
