
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/mineController.dart';
import 'package:flutter_module/router/Router.dart';
import 'package:flutter_module/tabbarViewModel.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class Mine extends StatefulWidget{

  _mineState createState() => _mineState();

}

class _mineState extends State<Mine>{
  @override
  Widget build(BuildContext context) {
    ///GetX 简单状态管理

    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.pink,
              child: Center(
                child: GetBuilder<MineController>(
                  init: MineController(),
                  builder: (_)=>Text('${_.count}'),
                ),
              )
            ),
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child:  Icon(Icons.add),
              ),
              onTap: ()=>MineController.to.increment(),
            ),

            GestureDetector(
                child:  Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50),
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Text("login"),
                ),
                onTap: (){
                  Get.toNamed(ZWRouter.loginRoute);
                },
            ),
          ],

        ),
      )
    );
  }


}