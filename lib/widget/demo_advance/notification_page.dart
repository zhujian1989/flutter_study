import 'package:flutter/material.dart';
import 'dart:math';

class TestNotification extends Notification {
  TestNotification({
    @required this.count,
  });

  final int count;
}

final GlobalKey key = new GlobalKey();

final GlobalKey<ScaffoldState> scaffoldStateKey = new GlobalKey<ScaffoldState>();


class NotificationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _NotificationPageState();
  }
}


class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldStateKey,
      appBar: new AppBar(
        title: new Text('Notification从下往上数据传递'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new NotificationListener(
              onNotification: (TestNotification n) {
                scaffoldStateKey.currentState.showSnackBar(new SnackBar(content: new Text('随机数：${n.count}')));
                return true;
              },
              child: new TestAPage(
                key: key,
              )),
        ],
      ),
    );
  }

}


class TestAPage extends StatefulWidget {
  TestAPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TestAPageState();
  }
}

class _TestAPageState extends State<TestAPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Center(
            child: new Text('点击传递随机数给上层Widget'),
          ),
          onPressed: () {
            new TestNotification(count: new Random().nextInt(100)).dispatch(key.currentContext);
          }),
    );
  }
}
