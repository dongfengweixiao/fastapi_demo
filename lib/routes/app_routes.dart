import 'package:fastapi_demo/ui/page/login/login_binding.dart';
import 'package:fastapi_demo/ui/page/login/login_page.dart';
import 'package:fastapi_demo/ui/page/splash/splash_page.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';

  static final routes = <GetPage>[
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
