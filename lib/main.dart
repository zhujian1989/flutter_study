import 'package:flutter/material.dart';
import 'package:flutter_study/widget/Home_page.dart';
import 'package:flutter_study/widget/demo_database/DataPage.dart';
import 'package:flutter_study/widget/demo_gesture/GesturePage.dart';
import 'package:flutter_study/widget/demo_route/RoutePage.dart';
import 'package:flutter_study/widget/demo_route/RoutePageWithValue1.dart';

void main() => runApp(new MaterialApp(
//    theme: defaultTargetPlatform == TargetPlatform.iOS
//        ? kiOSTheme
//        : kAndroidTheme,
//    theme: kAndroidTheme,
    routes: <String, WidgetBuilder>{
      '/RoutePage': (BuildContext context) => new RoutePage(),
      '/RoutePageWithValue1': (BuildContext context) =>
          new RoutePageWithValue1(),
      '/DataPage': (BuildContext context) => new DataAppPage(),
      '/GesturePage': (BuildContext context) => new GesturePage(),

    },
    home: new HomePage()));
