
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/tabbarViewModel.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class Mine extends StatefulWidget{

  _mineState createState() => _mineState();

}

class _mineState extends State<Mine>{
  @override
  Widget build(BuildContext context) {
  TabbarViewModel  vm = Provider.of<TabbarViewModel>(context);
  print("----  ${vm.currentIndex}");
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: WaterfallFlow(
          children: [1,2,3,4,5].map((int e){
            return Container(
              height: 100/e,
              color: Colors.red,
              child: Text("$e"),
            );
          }).toList(),
          padding: EdgeInsets.all(10),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            lastChildLayoutTypeBuilder: (index){
              return LastChildLayoutType.none;
            },
          ),
        ),
      ),
    );
  }


}