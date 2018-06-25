import 'package:flutter/material.dart';

class RoutePageWithValue1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _onPressed() {
      Navigator.of(context).pop('这是来自RoutePageWithValue1的返回值');
    }

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RoutePageWithValue1'),
        centerTitle: true,
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('点击带参数返回'),
            onPressed: _onPressed),
      ),

    );
  }
}
