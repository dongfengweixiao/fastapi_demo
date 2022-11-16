import 'package:fastapi_demo/routes/app_routes.dart';
import 'package:fastapi_demo/utils/inject.dart';
import 'package:fastapi_demo/utils/key_board.dart';
import 'package:fastapi_demo/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

void main() async {
  await SpUtil.init();
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      builder: FlutterSmartDialog.init(
        builder: ((context, child) {
          return Scaffold(
            body: GestureDetector(
              onTap: KeyboardUtils.hideKeyboard(context),
              child: child,
            ),
          );
        }),
      ),
    );
  }
}
