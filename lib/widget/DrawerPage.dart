import 'package:flutter/material.dart';


class DrawerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
            accountName: new Text('jzhu'),
            accountEmail: new Text('370159662@qq.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
            ),
        ),
        new ListTile(
            title: new Text('Route 学习'),
            trailing:new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/RoutePage');
            }
        ),
      new Divider(),
      ],

    );
  }

}
