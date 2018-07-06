import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StreamPageState();
  }
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("stream"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('待定'),
      ),
    );
  }
}



