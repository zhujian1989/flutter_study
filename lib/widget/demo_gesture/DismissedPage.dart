import 'package:flutter/material.dart';

class DismissedAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DismissedAppPageState();
  }
}

class _DismissedAppPageState extends State<DismissedAppPage> {
  List<String> list = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L'
  ];

  _showSnakeBar(String str) {
    final snackBar = new SnackBar(content: new Text(str));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dismissed 学习'),
        centerTitle: true,
      ),
      body: new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final String curItem = list[index];

            return new Dismissible(
                key: new Key(curItem),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  list.removeAt(index);
                  _showSnakeBar("$curItem 被划走了");
                },
                background: new Container(
                    child: new Center(
                      child: new Text('即将被删除'),
                    ),
                    color: Colors.red),
                child: new ListTile(
                  title: new Text(curItem),
                ));
          }),
    );
  }
}

class DismissedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new DismissedAppPage(),
    );
  }
}
