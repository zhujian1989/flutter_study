import 'package:flutter/material.dart';

class GestureAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _GestureAppPageState();
  }
}

class _GestureAppPageState extends State<GestureAppPage> {

  var tapEvent = '';

  _showSnakeBar(String str) {
    final snackBar = new SnackBar(content: new Text(str));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gesture 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('RaisedButton 点击'),
                onPressed: () {
                  _showSnakeBar("这是一个 RaisedButton 点击事件,onPressed处理");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new GestureDetector(
              onTap: () {
                _showSnakeBar("这是一个GestureDetector监听的onTap事件");
              },
              child: new BorderButton('GestureDetector onTap 按钮'),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child:
                new Text(tapEvent, style: Theme.of(context).textTheme.display1),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new GestureDetector(
              onTapDown: (tapDown) {
                setState(() {
                  tapEvent = '这是GestureDetector监听的onTapDown事件';
                });
              },
              onTapUp: (tapUp) {
                setState(() {
                  tapEvent = '这是GestureDetector监听的onTapUp事件';
                });
              },
              onTapCancel: () {
                setState(() {
                  tapEvent = '这是GestureDetector监听的onTapCancel事件';
                });
              },
              onDoubleTap: () {
                setState(() {
                  tapEvent = '这是GestureDetector监听的onDoubleTap事件';
                });
              },
              onLongPress: () {
                setState(() {
                  tapEvent = '这是GestureDetector监听的onLongPress事件';
                });
              },
              child: new BorderButton('GestureDetector onTap 分解事件按钮'),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('上面的按钮通过GestureDetector监听事件后，涟漪效果消失了，使用下面的方案解决'),
          ),
          new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new InkWell(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                onTap: () {
                  _showSnakeBar("这是一个InkWell监听的onTap事件");
                },
                child: new BorderButton('InkWell 按钮'),
              )),
          new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new InkWell(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                onTap: () {
                  Navigator.pushNamed(context, '/DismissedPage');
                },
                child: new BorderButton('Dismissed 手势'),
              )),
        ],
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;

  BorderButton(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
          left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
      height: 48.0,
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
//      foregroundDecoration: new BoxDecoration(
//        border: new Border.all(
//          width: 1.0,
//          color: Colors.red,
//        ),
//        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
//      ),
      child: new Text(text),
    );
  }
}

class GesturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new GestureAppPage(),
    );
  }
}
