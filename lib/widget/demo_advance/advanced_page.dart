import 'package:flutter/material.dart';

class AdvancedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AdvancedPageState();
  }
}

class _AdvancedPageState extends State<AdvancedPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('进阶 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('InheritedWidget使用'),
                onPressed: () {
                  Navigator.pushNamed(context, "/InheritedWidgetTestPage");
                }),
          ),

                 new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('GlobalKey使用'),
                onPressed: () {
                  Navigator.pushNamed(context, "/GlobalKeyFromPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Notification从下往上数据传递'),
                onPressed: () {
                  Navigator.pushNamed(context, "/NotificationPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('widget显示与隐藏'),
                onPressed: () {
                  Navigator.pushNamed(context, "/HideAndShowPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('StreamController'),
                onPressed: () {
                  Navigator.pushNamed(context, "/StreamPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('drag'),
                onPressed: () {
                  Navigator.pushNamed(context, "/DragPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Animation'),
                onPressed: () {
                  Navigator.pushNamed(context, "/AnimationPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Bloc'),
                onPressed: () {
                  Navigator.pushNamed(context, "/SearchPage");
                }),
          ),
        ],
      ),
    );
  }
}

