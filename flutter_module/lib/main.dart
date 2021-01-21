import 'package:flutter/material.dart';
import 'package:flutter_module/bottomNavigationPage.dart';
import 'package:flutter_module/homePage.dart';
import 'package:flutter_module/router/Router.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() => runApp(BoostApp());

class BoostApp extends StatefulWidget {
  @override
  _BoostAppState createState() => new _BoostAppState();
}

class _BoostAppState extends State<BoostApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.channel.addEventListener("native-flutter", (name, arguments) {
      print(name);
      if(arguments["message"] == "nativie sendEvent to flutter"){
        String code =  arguments["code"];
        print("code = $code");
      }
      print(arguments);
    });
    FlutterBoost.singleton.registerPageBuilders(ZWRouter.boostRoutes);

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Boost example',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      routes: ZWRouter.routes,
      home: BottomNavigationPage(),
    );
  }

  void _onRoutePushed(pageName,uniqueId,params,route,result){


  }

}


