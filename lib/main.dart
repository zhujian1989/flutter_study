import 'package:flutter/material.dart';
import 'package:flutter_study/widget/Home_page.dart';
import 'package:flutter_study/widget/demo_database/DataPage.dart';
import 'package:flutter_study/widget/demo_gesture/GesturePage.dart';
import 'package:flutter_study/widget/demo_gesture/DismissedPage.dart';
import 'package:flutter_study/widget/demo_route/RoutePage.dart';
import 'package:flutter_study/widget/demo_route/RoutePageWithValue1.dart';
import 'package:flutter_study/widget/demo_loadimg/LoadImgPage.dart';
import 'package:flutter_study/widget/demo_lifecycle/LifecyclePage.dart';
import 'package:flutter_study/widget/demo_network/NetworkPage.dart';

//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {

//  debugPaintSizeEnabled = true;      //打开视觉调试开关

  runApp(new MaterialApp(
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
      '/DismissedPage': (BuildContext context) => new DismissedPage(),
      '/LoadImgPage': (BuildContext context) => new LoadImgPage(),
      '/LifecyclePage': (BuildContext context) => new LifecyclePage(),
      '/NetworkPage': (BuildContext context) => new NetworkPage(),

    },
      home: new HomePage()));
}
