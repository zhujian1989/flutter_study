import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ChannelPageState();
  }
}

class _ChannelPageState extends State<ChannelPage> {

  static const jumpPlugin = const MethodChannel('com.jzhu.jumpPlugin');

  static const counterPlugin = const EventChannel('com.jzhu.counter/plugin');

  StreamSubscription _subscription = null;

  var _count;

  @override
  void initState() {
    super.initState();
    if(_subscription == null){
      _subscription =  counterPlugin.receiveBroadcastStream().listen(_onEvent,onError: _onError);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(_subscription != null){
      _subscription.cancel();
    }
  }

  void _onEvent(Object event) {
    setState(() {
      _count = event;
      print("_NativeJumpPageState:$event");
    });
  }

  void _onError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }



  Future<Null> _jumpToNative() async {
    String result = await jumpPlugin.invokeMethod('oneAct');

    print(result);
  }


  Future<Null> _jumpToNativeWithValue() async {

    Map<String, String> map = { "flutter": "这是一条来自flutter的参数" };

    String result = await jumpPlugin.invokeMethod('twoAct', map);

    print(result);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Channel"),
        centerTitle: true,
      ),
      body: new Center(
          child: new ListView(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('跳转到原生界面'),
                    onPressed: () {
                      _jumpToNative();
                    }),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 10.0, right: 10.0),
                child: new RaisedButton(
                    textColor: Colors.black,
                    child: new Text('跳转到原生界面(带参数)'),
                    onPressed: () {
                      _jumpToNativeWithValue();
                    }),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 10.0, right: 10.0),
                child: new Text('这是一个从原生发射过来的计时器：$_count'),
              ),
            ],
          )
      ),
    );
  }
}
