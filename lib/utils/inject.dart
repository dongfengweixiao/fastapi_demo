import 'package:fastapi_demo/http/request_repository.dart';
import 'package:get/get.dart';

class Inject {
  static void init() {
    Get.put<RequestRepository>(RequestRepository());
  }
}
