import 'package:flutter/material.dart';

class LoadImgByLocAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoadImgByLocAppPageState();
  }
}

class _LoadImgByLocAppPageState extends State<LoadImgByLocAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset(
              'images/ic_android_black_48dp.png',
            ),
            subtitle: new Text('加载images/ic_android_black_48dp.png'),
          ),
          new Divider(),
          new ListTile(
            leading: new Image.asset(
              'images/ic_assignment_ind_36pt.png',
            ),
            subtitle: new Text('加载images/ic_assignment_ind_36pt.png'),
          ),
          new Divider(),
        ],
      ),
    );
  }
}

class LoadImgByLocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new LoadImgByLocAppPage(),
    );
  }
}
