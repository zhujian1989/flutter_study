import 'package:flutter/material.dart';

class GestureAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _GestureAppPageState();
  }
}

class _GestureAppPageState extends State<GestureAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Gesture 学习'),
        centerTitle: true,
      ),
      body: new Text('GestureAppPage'),
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
