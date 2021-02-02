
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/homeDetailsPage.dart';
import 'package:flutter_module/homePageViewModel.dart';
import 'package:flutter_module/router/Router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'homeDetailsPage.dart';

class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin{
  HomePageViewModel viewModel = HomePageViewModel();
  TabController _tabController; //需要定义一个Controller
  List tabs = ["0","1","2","3"];
  @override
  void initState() {
    super.initState();
    viewModel.requsetBannerList();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void deactivate() {

  }
  /// 实现保持状态
  bool get wantKeepAlive => true;
  ///图片地址
  String imageUrl =
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2453876778,4252200680&fm=26&gp=0.jpg";
  @override
  Widget build(BuildContext context) {
setState(() {

});
    return Scaffold(
      body:ChangeNotifierProvider.value(
        value: viewModel,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: createCustomScrollView(),
      ),
      )
    );
  }

  Widget createCustomScrollView(){
// debugPaintSizeEnabled = true;
    ScreenUtil.init(context, width: 750, height: 1334);
    return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context,innerBoxIsScrolled)=>[
          customAppBar(),
          banner(),
          gridView(4),
        ],
        pinnedHeaderSliverHeightBuilder: (){
          return  44 + ScreenUtil.statusBarHeight;
        },
        innerScrollPositionKeyBuilder: (){
          String index = 'Tab';
          index += _tabController.index.toString();
          return  Key(index);
        },
        body: bodyView()
    );
  }


  Widget CustomRectSwiperPaginationBuilder(BuildContext context, SwiperPluginConfig config){

    List<Widget> list = [];

    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      Size size =  const Size(5, 2.0);
      list.add(Container(
        width: size.width,
        height: size.height,
        color: active ? Colors.deepPurpleAccent : Colors.white,
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(3),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }

  Widget customAppBar(){

    return SliverPersistentHeader(
        delegate: SliverCustomTabBarDelegate(
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(color: Colors.black26),
                  color: Colors.white
              ),
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Icon(Icons.search,color: Colors.black26),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text("11.11购物节",style: TextStyle(color: Colors.black26,fontSize: 13)),
                  ),
                ],
              ),
            ),
            onTap: (){
              print("getx -> router");
              Get.toNamed(ZWRouter.homeDetailsRoute);

            },
          ),
          appBarColor: Colors.pink,
          flexibleSpace: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover),
          expandedHeight: 150,
          collapsedHeight: 44,

        ),
      pinned: true,
    );

  }

  Widget banner(){
    return  SliverToBoxAdapter(
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child:Selector<HomePageViewModel,List>(
          selector: (context,viewModel)=>viewModel.bannerList,
          builder: (context,List list,child){

            if (list.length == 0){
              return Container(
                child: Text("banner"),
              );
            }
            return Swiper(
              itemCount:list.length,
              itemBuilder: (context,index){
                return Container(
                  child: CachedNetworkImage(
                      imageUrl: list[index],
                      placeholder: (context,url)=> CircularProgressIndicator(),
                      fit: BoxFit.cover
                  ),
                );
              },
              loop: true,
              autoplay: true,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: SwiperCustomPagination(
                  builder: CustomRectSwiperPaginationBuilder,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customWaterFolw(String e){
    String index = 'Tab' +  e;
    final key =  Key(index);
    return NestedScrollViewInnerScrollPositionKeyWidget(
        key,
        WaterfallFlow(
          key:PageStorageKey<String>(e),
          children: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].map((int e){
            return Container(
              height:  Random().nextInt(300).toDouble()+40,
              color: Colors.red,
              child: Text("$e"),
            );
          }).toList(),
          physics:  NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(10),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            lastChildLayoutTypeBuilder: (index){
              return LastChildLayoutType.none;
            },
          ),
        )
    );

}

  Widget waterFlow(){
    return SliverWaterfallFlow(
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        collectGarbage: (List<int> garbages) {
          print('collect first waterfall garbage : $garbages');
        },
        viewportBuilder: (int firstIndex, int lastIndex) {
          print('first waterfall  viewport : [$firstIndex,$lastIndex]');
        },
      ),
      delegate: SliverChildBuilderDelegate((BuildContext c, int index) {
        return GestureDetector(
          child: Container(
            height: Random().nextInt(200).toDouble()+30,
            child: Text("$index"),
            color: Colors.cyan,
          ),
          onTap: (){
            print("$index");

          },
        );
      }, childCount: 10),
    );
  }

  Widget listView(){
    return SliverFixedExtentList(
      itemExtent: 45,
      delegate: SliverChildBuilderDelegate(
              (context,index){
            return Container(
              child: Text("$index"),
            );
          },
          childCount: 10
      ),
    );
  }
  Widget gridView(int count){

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate((context,index){
        return Container(
          color: Colors.black26,
          child: Text("$index"),
        );
      },
          childCount: count
      ),
    );

  }

  Widget bodyView(){

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          indicatorColor: Colors.red,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.red,
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: tabs.map((e) { //创建Tab页
                return customWaterFolw(e);
              }).toList()
          ),
        ),
      ],
    );
  }
}


class SliverCustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget appBar;
  final Widget flexibleSpace;
  final double collapsedHeight;
  final double expandedHeight;
  final Color  appBarColor;
  const SliverCustomTabBarDelegate(this.appBar, {this.flexibleSpace,this.collapsedHeight = 44,this.expandedHeight = 44,this.appBarColor = Colors.white})
      : assert(appBar != null);

  Color makeAppBarColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();

    return this.appBarColor.withAlpha(alpha);
  }
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
    return Container(
      width: ScreenUtil.screenWidth,
      height: this.expandedHeight,
      color: Colors.blue,
      child: Stack(
        fit: StackFit.expand,
        children: [
          this.flexibleSpace,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: this.minExtent,
            child: Container(
              color:makeAppBarColor(shrinkOffset),
              padding: EdgeInsets.only(top:ScreenUtil.statusBarHeight),
              child:Opacity(
                child:this.appBar,
                opacity:alpha/255,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverCustomTabBarDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => this.expandedHeight;

  @override
  double get minExtent => collapsedHeight + ScreenUtil.statusBarHeight ;
}
