
import 'package:flutter/material.dart';
import 'package:flutter_boost/container/boost_page_route.dart';
import 'package:flutter_module/homeDetailsPage.dart';
import 'package:flutter_module/homePage.dart';
import 'package:flutter_module/searchPage.dart';


class ZWRouter {

  static final Map<String,PageBuilder> boostRoutes = {
    HomePage.routeName:(pageName,params,uniqueId)=>HomePage(),
    HomeDetailsPage.routeName:(pageName,params,uniqueId)=>HomeDetailsPage(),
    SearchPage.routeName:(pageName,params,uniqueId)=>SearchPage(),
  };

  static final Map<String,WidgetBuilder> routes = {
    HomePage.routeName:(cxt)=> HomePage(),
    HomeDetailsPage.routeName:(cxt)=> HomeDetailsPage(),
    SearchPage.routeName:(cxt)=>SearchPage(),
  };
}