import 'package:flutter/material.dart';

class RoutePageWithValue extends StatelessWidget {
  final String lastPageName;

  RoutePageWithValue(this.lastPageName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('RoutePageWithValue'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text('$lastPageName'),
        ));
  }
}
