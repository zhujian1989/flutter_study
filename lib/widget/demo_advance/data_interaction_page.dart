import 'package:flutter/material.dart';

class DataInteractionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new TestAPage(),
          new TestBPage(),
          new TestCPage(),
        ],
      ),
    );
  }
}

class TestAPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestAPageState();
  }
}

class _TestAPageState extends State<TestAPage> {

  int _count;

  @override
  void initState() {
    super.initState();
    print('state');
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('+'),
          onPressed: () {
            _count++;
            setState(() {});
          }),
    );
  }
}

class TestBPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestBPageState();
  }
}

class _TestBPageState extends State<TestBPage> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black, child: new Text('-'), onPressed: () {}),
    );
  }
}

class TestCPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestCPageState();
  }
}

class _TestCPageState extends State<TestCPage> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: new Container(
          height: 200.0,
          alignment: Alignment.center,
          child: new Text(
            'count：',
            style: new TextStyle(color: Colors.red, fontSize: 30.0),
          ),
        ));
  }
}
