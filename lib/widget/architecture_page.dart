import 'package:flutter/material.dart';

class ArchitecturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ArchitecturePageState();
  }
}

class _ArchitecturePageState extends State<ArchitecturePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Architecture 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('MVP(参考主页tab)'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/HomePage');
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('BLoC'),
                onPressed: () {
                  Navigator.pushNamed(context, "/SearchPage");
                }),
          ),
        ],
      ),
    );
  }
}

