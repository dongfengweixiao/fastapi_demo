import 'package:fastapi_demo/http/request_repository.dart';
import 'package:fastapi_demo/res/r.dart';
import 'package:fastapi_demo/routes/app_routes.dart';
import 'package:fastapi_demo/utils/sp_util.dart';
import 'package:fastapi_demo/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  late RequestRepository request;

  @override
  void initState() {
    request = Get.find();
    _tween = Tween(begin: 0, end: 1);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..drive(_tween);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuart,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _intentPage();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _buildTitle(),
              _buildSlogan(),
            ],
          ),
        ),
      ),
    );
  }

  _buildLogo() {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(
        R.images.logo,
      ),
    );
  }

  _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Text(
        'FastAPI Demo',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  _buildSlogan() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Text(
        'FastAPI usage',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  void _intentPage() {
    if (SpUtil.checkAccessToken) {
      var payload = Jwt.parseJwt(SpUtil.refreshToken);
      if (DateTime.now().millisecondsSinceEpoch / 1000 - payload['exp'] > 1) {
        Get.offAndToNamed(Routes.login);
        ToastUtil.show("Login expired, please login again");
      } else {
        request.refreshToken(
          refreshToken: SpUtil.refreshToken,
          success: (resp) {
            var data = resp.data['data'];
            SpUtil.accessToken = data["access_token"];
            // Get.offAllNamed(Routes.index);
          },
          fail: (msg) {
            Get.offAndToNamed(Routes.login);
            ToastUtil.show('Login expired, please login again');
          },
        );
      }
    } else {
      Get.offAndToNamed(Routes.login);
    }
  }
}
