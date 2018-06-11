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
      body: new Center(
        child: new GestureDetector(
          child: new Text('手势测试'),
          onHorizontalDragStart: (dragStart) {
            print(dragStart.globalPosition);
          },
          onHorizontalDragUpdate: (dragUpdate) {
            print(dragUpdate.globalPosition);
          },

          onHorizontalDragDown: (dragDown) {
            print(dragDown.globalPosition);
          },

          onHorizontalDragEnd: (dragEnd) {
          },

          onHorizontalDragCancel: () {
            print('onHorizontalDragCancel');
          },
//          onTapUp: (tapUpDetails) {
//            print(tapUpDetails.globalPosition);
//          },
//          onTapDown: (tapDownDetails) {
//            print(tapDownDetails .globalPosition);
//          },
//          onTapCancel: () {
//            print('onTapCancel');
//          },

        ),
      ),
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
