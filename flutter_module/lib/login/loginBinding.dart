import 'package:flutter_module/login/loginController.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}