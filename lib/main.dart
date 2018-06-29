import 'package:flutter/material.dart';
import 'package:flutter_study/widget/demo_advance/advanced_page.dart';
import 'package:flutter_study/widget/demo_advance/data_interaction_page.dart';
import 'package:flutter_study/widget/demo_advance/inherited_w_page.dart';
import 'package:flutter_study/widget/home_page.dart';
import 'package:flutter_study/widget/demo_database/data_page.dart';
import 'package:flutter_study/widget/demo_gesture/gesture_page.dart';
import 'package:flutter_study/widget/demo_gesture/dismissed_page.dart';
import 'package:flutter_study/widget/demo_route/route_page.dart';
import 'package:flutter_study/widget/demo_route/route_page_with_value_one.dart';
import 'package:flutter_study/widget/demo_loadimg/loadImg_page.dart';
import 'package:flutter_study/widget/demo_lifecycle/lifecycle_page.dart';
import 'package:flutter_study/widget/demo_network/network_page.dart';

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
      '/ProblemPage': (BuildContext context) => new AdvancedPage(),
      '/DataInteractionPage': (BuildContext context) => new DataInteractionPage(),
      '/InheritedWidgetTestPage': (BuildContext context) => new InheritedWidgetTestContainer(),

    },
      home: new HomePage()));
}
