import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_loadimg/LoadImgByLocPage.dart';
import 'package:flutter_study/widget/demo_loadimg/LoadImgByNetPage.dart';

const List<String> tabs = ['网络加载','本地加载'];

class LoadImgAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadImgAppPageState();
  }
}

class _LoadImgAppPageState extends State<LoadImgAppPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          tabs: tabs.map((String title) {
            return new Tab(
              text: title,
            );
          }).toList(),
        ),
      ),
      body: new TabBarView(controller: _tabController, children: [
        new LoadImgByNetPage(),
        new LoadImgByLocPage(),
      ]),
    );
  }
}

class LoadImgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new LoadImgAppPage(),
    );
  }
}
