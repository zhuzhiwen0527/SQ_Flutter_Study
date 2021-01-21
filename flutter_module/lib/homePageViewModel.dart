
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_module/HttpRequest.dart';

class HomePageViewModel extends ChangeNotifier{

  List _bannerList = [];
  
  List get bannerList => _bannerList;
  
  set bannerList(value){
    _bannerList = value;
    notifyListeners();
  }

  String _title = "首页";

  String get  title => _title;
  
  set title(value){
    _title = value;
    notifyListeners();
  }
  
  String _title1 = "11";

  String get  title1 => _title1;

  set title1(value){
    _title1 = value;
    notifyListeners();
  }

  String _title2 = "22";

  String get  title2 => _title2;

  set title2(value){
    _title2 = value;
    notifyListeners();
  }

  void requsetBannerList() async{
    var url = "https://a4cj1hm5.api.lncld.net/1.1/classes/shopCarousel";
    await HttpRequest.requset(url,method: "GET").then((value){

      Map<String, dynamic> map = value;
      List list = map["results"];
      List<String>  banner = [];
      for (int i = 0 ; i < list.length ; i++){
        final m = list[i];
        banner.add(m["url"]);
      }
      this.bannerList = banner;
    });
  }
}