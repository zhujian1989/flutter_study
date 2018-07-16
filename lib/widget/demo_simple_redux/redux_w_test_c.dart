import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_redux.dart';

class TestWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child:
          new StoreConnector<int, VoidCallback>(builder: (context, callback) {
        return new Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: new RaisedButton(
              textColor: Colors.black,
              child: new Text('-'),
              onPressed: callback),
        );
      }, converter: (store) {
        return () => store.dispatch(Actions.Reduce);
      }),
    );
  }
}
