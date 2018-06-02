import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/theme/CustomTheme.dart';
import 'package:flutter_study/widget/Home_page.dart';

void main() => runApp(new MaterialApp(
  //根据系统使用不同的主题
    theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kiOSTheme
        : kAndroidTheme,
    home: new HomePage()
)
);



