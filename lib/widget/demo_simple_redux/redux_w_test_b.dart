import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new StoreConnector<int, String>(
          builder: (context, count) {
            return new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: new Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new Text(
                  '当前count:$count',
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
            );
          },
          converter: (store) => store.state.toString()),
    );
  }
}
