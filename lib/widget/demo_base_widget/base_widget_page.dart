import 'package:flutter/material.dart';

class BaseWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BaseWidgetPageState();
  }
}

class _BaseWidgetPageState extends State<BaseWidgetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('基础Widget 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Container'),
                onPressed: () {
                  Navigator.pushNamed(context, "/ContainerPage");
                }),
          ),
        ],
      ),
    );
  }
}
