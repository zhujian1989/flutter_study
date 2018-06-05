import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/theme/CustomTheme.dart';
import 'package:flutter_study/widget/Home_page.dart';
import 'package:flutter_study/widget/demo_route/RoutePage.dart';
import 'package:flutter_study/widget/demo_route/RoutePageWithValue1.dart';

void main() => runApp(new MaterialApp(
  //根据系统使用不同的主题
    theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kiOSTheme
        : kAndroidTheme,
    routes: <String,WidgetBuilder>{
      '/RoutePage':(BuildContext context) => new RoutePage(),
      '/RoutePageWithValue1':(BuildContext context) => new RoutePageWithValue1(),

    },
    home: new HomePage()
)
);



