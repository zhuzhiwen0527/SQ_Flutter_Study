import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MineController extends GetxController {

  static MineController get to => Get.find<MineController>();

  int count = 1;

  increment() {
    count ++;
    update();
  }

}