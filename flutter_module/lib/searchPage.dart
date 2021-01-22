

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';

class  SearchPage extends StatefulWidget{
  static final routeName = "/SearchPage";
  _searchPageState createState()=>_searchPageState();
}

class _searchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("platform View"),
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: (){
              FlutterBoost.singleton.closeCurrent();
            },
            child: Icon(Icons.arrow_back_ios_outlined),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: UiKitView(
              viewType: "platform_text_view",
              creationParams: {"text":"原生视图"},
              creationParamsCodec:StandardMessageCodec()
          ),
        )
      ),
    );
  }
}