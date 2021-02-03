import 'dart:async';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {

  var phoneNumber = 0.obs;
  var verificationCode = 0.obs;
  var isPhone = false.obs;
  var verificationCodeSate = false.obs;
  var verificationCodeButtonName = '获取验证码'.obs;

  var verificationCodeButtonEnabled = false.obs;
  int _count = 60;
  Timer _timer;

  verificationPhoneNumber(String number){
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");

    isPhone.value = mobile.hasMatch(number);
    verificationCodeButtonEnabled.value = isPhone.value;
  }

  verificationCodeNumber(String code){
    RegExp mobile = new RegExp(r"\d{6}$");
    verificationCodeSate.value = mobile.hasMatch(code);
  }

  getverificationCodeNumber(){
    verificationCodeButtonEnabled.value = false;
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      _count--;
      verificationCodeButtonName.value = '$_count 秒';
      if(_count == 0)
        {
          verificationCodeButtonName.value = "获取验证码";
          _count = 60;
        _timer.cancel();
        }
    });
  }

  @override
  void onClose() {

    if (_timer != null) {   // 页面销毁时触发定时器销毁
      if (_timer.isActive) {  // 判断定时器是否是激活状态
        _timer.cancel();
      }
    }
    super.onClose();
  }

}