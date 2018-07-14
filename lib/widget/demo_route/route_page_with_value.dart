import 'dart:async';

import 'package:flutter/material.dart';

class RoutePageWithValue extends StatelessWidget {
  final String lastPageName;

  BuildContext context;

  RoutePageWithValue(this.lastPageName);

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出当前界面'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pop();
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
    this.context = context;
    //监听左上角返回和实体返回
    return new WillPopScope(
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('RoutePageWithValue'),
              centerTitle: true,
            ),
            body: new Center(
              child: new Text('$lastPageName'),
            )),
        onWillPop: _requestPop);
  }
}
