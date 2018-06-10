import 'package:flutter/material.dart';

class DrawerWeiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DrawerWeigetState();
  }
}

class _DrawerWeigetState extends State<DrawerWeiget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('XXXXX'),
          accountEmail: new Text('XXXXXXXXXXX'),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage(
                'http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
          ),
        ),
        new ListTile(
            title: new Text('Route 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/RoutePage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('数据存储 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/DataPage');
            }),
        new Divider(),
      ],
    );
  }
}

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       body:new DrawerWeiget(),
    );
  }
}
