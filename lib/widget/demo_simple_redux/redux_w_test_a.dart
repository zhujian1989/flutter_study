import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study/widget/demo_simple_redux/count_redux.dart';

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<int, VoidCallback>(
      converter: (store) {
        return () => store.dispatch(Actions.Increment);
      },
      builder: (context, callback) {
        return new Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: new RaisedButton(
              textColor: Colors.black,
              child: new Text('+'),
              onPressed: callback),
        );
      },
    );
  }
}
