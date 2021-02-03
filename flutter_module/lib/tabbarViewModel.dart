
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/mine.dart';
import 'package:flutter_module/homePage.dart';

class TabbarViewModel extends ChangeNotifier{

  ///放着各个tabbar对应的数组
 static final List<Widget> pages = [
    HomePage(),
    Mine()
  ];

 List<BottomNavigationBarItem> _items = [
   BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
   BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("我的"))
 ];
    String _home = "首页";
   int _currentIndex = 0;


   List<BottomNavigationBarItem> get items {
     return [BottomNavigationBarItem(icon: Icon(Icons.home),title: Text(_home)),
             BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的"))];
   }

   String get home => _home;
   set home(value){
     _home = value;
     notifyListeners();
   }

   int get currentIndex => _currentIndex;
   set currentIndex(value){
     _currentIndex = value;
     notifyListeners();
   }

}