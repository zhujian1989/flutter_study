import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/widget/demo_localizations/localizations_study.dart';
import 'package:flutter_study/widget/drawer_page.dart';
import 'package:flutter_study/widget/tab_android_page.dart';
import 'package:flutter_study/widget/tab_girl_page.dart';
import 'package:flutter_study/widget/tab_ios_page.dart';
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

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出app'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
                Navigator.pop(context);
            },
            child: new Text('确定'))
      ]),
    );
  }


  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    return new WillPopScope(child: new Scaffold(
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
            _curIndex = index;
          });
        },
      ),
      body: _body,
    ), onWillPop: _requestPop);
  }
}
