import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/tabbarViewModel.dart';
import 'package:provider/provider.dart';

class BottomNavigationPage extends StatefulWidget{

  _BottomNavigationPateState createState() => _BottomNavigationPateState();
}

class _BottomNavigationPateState extends State<BottomNavigationPage>{

  @override
    Widget build(BuildContext context) {
    // TODO: implement build
     return MultiProvider(
       providers: [
         ChangeNotifierProvider<TabbarViewModel>(create: (ctx) => TabbarViewModel()),
       ],
       child: Consumer<TabbarViewModel>(
         builder: (context,vm,child){
           return Scaffold(
             body: IndexedStack(
               index: vm.currentIndex,
               children: TabbarViewModel.pages,
             ),
             bottomNavigationBar: BottomNavigationBar(
               items: vm.items,
               currentIndex:vm.currentIndex,
               onTap: (index){
                 vm.currentIndex = index;
               },
             ),
           );
         }
       )
     );

    }
}