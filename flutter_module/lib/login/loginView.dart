import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_module/login/loginController.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController>{
 // 响应式状态管理器
  @override
  Widget build(BuildContext context) {

    print("登录页面");
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    inputWidget(hintText: "11位手机号",maxLength: 11,cb: (val)=>controller.verificationPhoneNumber(val)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: inputWidget(hintText: "6位验证码",maxLength: 6,cb: (val)=>controller.verificationCodeNumber(val)),
                          width: Get.width - 170,
                        ),
                        Obx(() => OutlinedButton(onPressed:controller.verificationCodeButtonEnabled == true ?getVerificationCode:null, child: Text(controller.verificationCodeButtonName.value,style: TextStyle(
                            color: controller.isPhone == true ? Colors.black:Colors.black38
                            ),
                          ),
                         )
                        ),

                      ],
                    )
                  ],
                )
            ),
            Obx(() => GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50),
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                      color:controller.verificationCodeSate.value == true ? Colors.pink:Colors.black38,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text("登录"),
                ),
                onTap: (){

                }
            )),
          ],
        ),
      ),
    );
  }

  void getVerificationCode(){
    print("获取验证码");
    controller.getverificationCodeNumber();
  }

  Widget inputWidget(
      {String hintText,int maxLength, Function cb}) {
    return TextField(
      decoration: InputDecoration(
        hintText: "请输入" + hintText,
        hintStyle: TextStyle(color: Colors.black38),
        border: InputBorder.none,
        counterText: ''
      ),
      maxLength: maxLength,
      onChanged: (val) => cb(val),
    );
  }
}