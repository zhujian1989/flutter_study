import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/common/widget/progreess_dialog.dart';
import 'package:flutter_study/model/base_model.dart';
import 'package:flutter_study/model/search_model.dart';

class NativeJumpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NativeJumpPageState();
  }
}

class _NativeJumpPageState extends State<NativeJumpPage> {

  @override
  void initState() {
    super.initState();
  }


  _pressed(){
    const jumpPlugin = const MethodChannel('com.jzhu.jumpPlugin');

    jumpPlugin.invokeMethod('goAndroidActivity');
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("native jump"),
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
                      _pressed();
                    }),
              ),
            ],
          )
      ),
    );
  }
}
