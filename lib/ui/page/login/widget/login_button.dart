import 'package:fastapi_demo/res/style.dart';
import 'package:fastapi_demo/widget/gradient_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      onTap: onTap,
      borderRadius: 25.0,
      colors: [Colors.lightBlue.shade300, Colors.blueAccent],
      child: const Text(
        'Login',
        style: Style.white20,
      ),
    );
  }
}
