import 'package:flutter/material.dart';

class RoutePageWithValue1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _onPressed() {
      Navigator.of(context).pop('这是来自RoutePageWithValue1的返回值');
    }

    _onPressed1() {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomePage', (Route<dynamic> route) => false);
    }


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RoutePageWithValue1'),
        centerTitle: true,
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[

            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('点击带参数返回'),
                  onPressed: _onPressed),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('点击直接去HomePage，销毁其他所有的页面'),
                  onPressed: _onPressed1),
            ),
          ],
        ),
      ),

    );
  }
}
