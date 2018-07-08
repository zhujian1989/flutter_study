import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationPageState();
  }
}

class _AnimationPageState extends State<AnimationPage> {



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Animation"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('待定'),
      ),
    );
  }
}



