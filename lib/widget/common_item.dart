import 'package:flutter/material.dart';



Widget buildCommonItem(BuildContext context, int index) {
  return new Row(
    children: <Widget>[
      new Expanded(
        child: new Text('Deliver features faster', textAlign: TextAlign.center),
      ),
      new Expanded(
        child: new Text('Craft beautiful UIs', textAlign: TextAlign.center),
      ),
      new Expanded(
        child: new FittedBox(
          fit: BoxFit.contain, // otherwise the logo will be tiny
          child: const FlutterLogo(),
        ),
      ),
    ],
  );
}
