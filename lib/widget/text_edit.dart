import 'package:fastapi_demo/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextEditeWidget extends StatelessWidget {
  const TextEditeWidget({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText,
    this.isNumber = false,
  });

  final String? hintText;

  final bool? obscureText;

  final TextEditingController? controller;

  final bool? isNumber;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      obscureText: obscureText ?? false,
      style: Style.white18,
      keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
      inputFormatters: [
        if (isNumber!)
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
      ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Style.white18,
        border: InputBorder.none,
      ),
    );
  }
}
