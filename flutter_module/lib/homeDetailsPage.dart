
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeDetailsPage extends StatefulWidget{
  static final routeName = "/HomeDetailsPage";
  _homeDetailsState createState() => _homeDetailsState();
}
class _homeDetailsState extends State<HomeDetailsPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
        leading: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Center(
              child: Text("返回"),
            ),
          ),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),

      body: NestedScrollView(),
    );
  }
}