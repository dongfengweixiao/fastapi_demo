import 'package:fastapi_demo/http/request_repository.dart';
import 'package:get/get.dart';

class BaseGetController extends GetxController {
  late RequestRepository repository;

  @override
  void onInit() {
    repository = Get.find();
    super.onInit();
  }
}
