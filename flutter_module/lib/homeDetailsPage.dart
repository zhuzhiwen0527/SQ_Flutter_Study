
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeDetailsPage extends StatefulWidget{


  _homeDetailsState createState() => _homeDetailsState();
}
class _homeDetailsState extends State<HomeDetailsPage> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin{

  TabController _tabController; //需要定义一个Controller
  List tabs = ["1","2","3","4"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
      // appBar: AppBar(
      //   title: Text("详情"),
      //   leading: GestureDetector(
      //     child: Container(
      //       margin: EdgeInsets.only(left: 10),
      //       child: Center(
      //         child: Text("返回"),
      //       ),
      //     ),
      //     onTap: (){
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),

      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context,innerBoxIsScrolled)=>[
          SliverAppBar(
            pinned: true,
            title: const Text('Floating Nested SliverAppBar'),
            floating: true,
            expandedHeight: 200.0,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
              indicatorColor: Colors.red,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
            ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) { //创建Tab页
            return Builder(
                builder: (context){
                  return CustomScrollView(
                    key: PageStorageKey<String>(e),
                    slivers: [
                      SliverFixedExtentList(
                        itemExtent: 50,
                        delegate: SliverChildBuilderDelegate(
                                (context,index){
                              return Container(
                                child: Text("$index"),
                              );
                            },
                            childCount: 40
                        ),
                      )
                    ],
                  );
                });
          }
          ).toList(),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}