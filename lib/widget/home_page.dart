import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_localizations/localizations_study.dart';
import 'package:flutter_study/widget/tab_android_page.dart';
import 'package:flutter_study/widget/tab_girl_page.dart';
import 'package:flutter_study/widget/tab_ios_page.dart';
import 'package:flutter_study/widget/drawer_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final _key = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var _body;

  var _curIndex = 0;

  _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new TabGirlPage(),
        new TabAndroidPage(),
        new TabiOSPage(),
      ],
      index: _curIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    return new Scaffold(
      key: _key,
      appBar: new AppBar(
        title: new Text(StudyLocalizations.of(context)
            .appTitle),
        centerTitle: true,
      ), //头部的标题AppBar
      drawer: new Drawer(
        child: new DrawerPage(),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("妹子")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.phone_android), title: new Text("Android")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.phone_iphone), title: new Text("iOS")),
        ],
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            print('$_curIndex');
            _curIndex = index;
          });
        },
      ),
      body: _body,
    );
  }
}
