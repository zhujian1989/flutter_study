import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_middleware.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_redux.dart';
import 'package:flutter_study/widget/demo_simple_redux/redux_w_test_a.dart';
import 'package:flutter_study/widget/demo_simple_redux/redux_w_test_b.dart';
import 'package:flutter_study/widget/demo_simple_redux/redux_w_test_c.dart';
import 'package:redux/redux.dart';



class CountReduxPage extends StatelessWidget {

  static GlobalKey countKey = new GlobalKey<ScaffoldState>();

  final store = new Store<int>(counterReducer,  middleware: [new CountMiddleware(countKey)] ,initialState: 0);

  @override
  Widget build(BuildContext context) {

    return new StoreProvider<int>(
      store: store,
      child: new Scaffold(
        key: countKey,
        appBar: new AppBar(
          title: new Text('Simple Redux'),
        ),
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new TestWidgetA(),
              new TestWidgetB(),
              new TestWidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}
