import 'package:flutter/material.dart';
import 'package:flutter_module/bottomNavigationPage.dart';
import 'package:flutter_module/homePage.dart';
import 'package:flutter_module/router/Router.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
void main() => runApp(BoostApp());

class BoostApp extends StatefulWidget {
  @override
  _BoostAppState createState() => new _BoostAppState();
}

class _BoostAppState extends State<BoostApp> {
  @override
  void initState() {
    super.initState();
    
    FlutterBoost.singleton.registerPageBuilders(ZWRouter.boostRoutes);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      builder: FlutterBoost.init(),
      routes: ZWRouter.routes,
      home:GetMaterialApp(
        home: BottomNavigationPage(),
        getPages: ZWRouter.GetRoutes,
      )
    );

}

  void _onRoutePushed(pageName,uniqueId,params,route,result){


  }

}


