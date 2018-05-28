import 'package:flutter/material.dart';
import 'package:flutter_study/widget/TabAndroidPage.dart';
import 'package:flutter_study/widget/TabGirlPage.dart';
import 'package:flutter_study/widget/TabiOSPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(
      icon: new Icon(Icons.home),
      text: '妹子',
    ),
    new Tab(
      icon: new Icon(Icons.phone_android),
      text: 'Android',
    ),
    new Tab(
      icon: new Icon(Icons.phone_iphone),
      text: 'iOS',
    ),
  ];

  //定义底部导航Tab
  TabController _bottomNavigation;

  //初始化导航Tab控制器
  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(
        vsync: this,
        length: _bottomTabs.length
        );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _bottomNavigation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: new Text('flutter study'),
        ), //头部的标题AppBar
        body: new TabBarView(controller: _bottomNavigation, children: [
          new TabGirlPage(),
          new TabAndroidPage(),
          new TabiOSPage(),
        ]),
        bottomNavigationBar: new Material(
          color: Colors.green,
          child: new TabBar(
            controller: _bottomNavigation,
            tabs: _bottomTabs,
            indicatorColor: Colors.white,
          ),
        ));
  }
}
