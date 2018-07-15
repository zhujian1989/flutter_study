import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HideAndShowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HideAndShowPageState();
  }
}

class _HideAndShowPageState extends State<HideAndShowPage> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('widget显示与隐藏'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text(visible ? '隐藏B  隐藏c  显示A ' : '隐藏A   显示c 显示B'),
                onPressed: () {
                  visible = !visible;
                  setState(() {});
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Stack(
              children: <Widget>[
                new TestAWidget(
                  visible: visible,
                ),
                new TestBWidget(
                  visible: !visible,
                ),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new TestCWidget(visible: visible),
          ),
        ],
      ),
    );
  }
}





class TestAWidget extends StatelessWidget {
  final bool visible;

  const TestAWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: new Container(
        color: Colors.blue,
        height: 100.0,
        child: new Center(
          child: new Text('TestAWidget'),
        ),
      ),
    );
  }
}

class TestBWidget extends StatelessWidget {
  final bool visible;

  const TestBWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: new Container(
        color: Colors.green,
        height: 100.0,
        child: new Center(
          child: new Text('TestBWidget'),
        ),
      ),
    );
  }
}




class TestCWidget extends StatelessWidget {
  final bool visible;

  const TestCWidget({Key key, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Offstage(
      offstage: visible,
      child:new Container(
        color: Colors.orange,
        height: 100.0,
        child: new Center(
          child: new Text('TestCWidget'),
        ),
      ),
    );
  }
}
