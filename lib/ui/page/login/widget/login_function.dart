import 'package:fastapi_demo/res/style.dart';
import 'package:flutter/material.dart';

Widget loginTitle() {
  return const Text(
    'Email Login',
    style: Style.white30bold,
  );
}

Widget loginBox({required List<Widget> children}) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}

Widget loginInputArea({required List<Widget> children}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Theme(
      data: ThemeData(
        primaryColor: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ),
  );
}
