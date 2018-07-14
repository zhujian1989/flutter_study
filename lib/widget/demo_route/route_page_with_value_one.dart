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

    _onPressed2() {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomePage', ModalRoute.withName('/HomePage'));
    }

    _onPressed3() {
      Navigator.popUntil(context, ModalRoute.withName('/HomePage'));
    }

    _onPressed4() {
      Navigator.of(context).pushReplacementNamed('/StreamPage');
    }


    _onPressed5() {
      Navigator.popAndPushNamed(context, '/StreamPage');
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
                  child: new Text('销毁其他所有的页面，点击直接去新的HomePage'),
                  onPressed: _onPressed1),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('销毁栈内除了HomePage的页面，点击直接去栈内HomePage'),
                  onPressed: _onPressed2),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('销毁除了栈顶的所有页面'),
                  onPressed: _onPressed3),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('跳转并销毁当前页面（1）'),
                  onPressed: _onPressed4),
            ),
            new Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0),
              child: new RaisedButton(
                  child: new Text('跳转并销毁当前页面（2）'),
                  onPressed: _onPressed5),
            ),

          ],
        ),
      ),

    );
  }
}
