
import 'package:flutter/material.dart';
import 'package:flutter_boost/container/boost_page_route.dart';
import 'package:flutter_module/homeDetailsPage.dart';
import 'package:flutter_module/homePage.dart';
import 'package:flutter_module/searchPage.dart';
import 'package:get/get.dart';


class ZWRouter {

  static final homeRoute = "/Home";
  static final homeDetailsRoute = "/HomeDetailsPage";
  static final searchRoute = "/SearchPage";
  static final Map<String,PageBuilder> boostRoutes = {
    homeRoute:(pageName,params,uniqueId)=>GetMaterialApp(home: HomePage(),getPages: GetRoutes,),
    homeDetailsRoute:(pageName,params,uniqueId)=>GetMaterialApp(home: HomeDetailsPage(),getPages: GetRoutes),
    searchRoute:(pageName,params,uniqueId)=>GetMaterialApp(home: SearchPage(),getPages: GetRoutes),
  };

  static final List<GetPage> GetRoutes = [
    GetPage(name: homeRoute, page: ()=>HomePage()),
    GetPage(name: homeDetailsRoute, page: ()=>HomeDetailsPage()),
    GetPage(name: searchRoute, page: ()=>SearchPage()),
  ];

  static final Map<String,WidgetBuilder> routes = {
    homeRoute:(cxt)=> HomePage(),
    homeDetailsRoute:(cxt)=> HomeDetailsPage(),
    searchRoute:(cxt)=>SearchPage(),
  };
}