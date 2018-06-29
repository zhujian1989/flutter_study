import 'dart:math';

import 'package:flutter/material.dart';

class DataInteractionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数据交互'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new TestAPage(),
          new TestBPage(),
          new TestCPage(),
        ],
      ),
    );
  }
}

class TestAPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestAPageState();
  }
}

class _TestAPageState extends State<TestAPage> {
  int curCount = 0;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('+'),
          onPressed: () {
            curCount++;
          }),
    );
  }
}

class TestBPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestBPageState();
  }
}

class _TestBPageState extends State<TestBPage> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black, child: new Text('-'), onPressed: () {}),
    );
  }
}

class TestCPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TestCPageState();
  }
}

class _TestCPageState extends State<TestCPage> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: new Container(
          height: 200.0,
          alignment: Alignment.center,
          child: new Text(
            'count：',
            style: new TextStyle(color: Colors.red, fontSize: 30.0),
          ),
        ));
  }
}


void main() {
  runApp(new AppContainer());
}

class AppContextData {
  final String appName;
  final int value;
  final ThemeData themeData;

  const AppContextData({this.appName, this.value, this.themeData});

  AppContextData withName(String newAppName) {
    return new AppContextData(
        appName: newAppName, value: value, themeData: themeData);
  }

  AppContextData increment() {
    return new AppContextData(
        appName: appName, value: value + 1, themeData: themeData);
  }

  AppContextData withTheme(ThemeData themeData) {
    return new AppContextData(
        appName: appName, value: value, themeData: themeData);
  }
}

class AppContext extends InheritedWidget {
  final AppContextData appContextData;
  final Function(String title) updateTitle;
  final Function() increment;
  final Function() changeTheme;

  AppContext({
    Key key,
    @required this.appContextData,
    @required this.updateTitle,
    @required this.increment,
    @required this.changeTheme,
    @required Widget child,
  })
      : super(key: key, child: child);

  static AppContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppContext);
  }

  @override
  bool updateShouldNotify(AppContext old) =>
      appContextData != old.appContextData;
}

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => new _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  AppContextData appContextData;

  @override
  void initState() {
    appContextData = new AppContextData(
        appName: "mon titre",
        value: 0,
        themeData: new ThemeData(
          primarySwatch: Colors.blue,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AppContext(
        appContextData: appContextData,
        updateTitle: _updateTitle,
        increment: _increment,
        changeTheme: _changeTheme,
        child: new MyApp());
  }

  void _updateTitle(String title) {
    setState(() {
      appContextData = appContextData.withName(title);
    });
  }

  void _increment() {
    setState(() {
      appContextData = appContextData.increment();
    });
  }

  void _changeTheme() {
    setState(() {
      Random rnd = new Random();
      var index = rnd.nextInt(Colors.primaries.length);
      appContextData = appContextData.withTheme(new ThemeData(
        primarySwatch: Colors.primaries[index],
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appContext = AppContext.of(context);
    final appContextData = appContext.appContextData;

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: appContextData.themeData,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appContext = AppContext.of(context);
    final appContextData = appContext.appContextData;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(appContextData.appName),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '${appContextData.value}',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text("Set new title below:"),
            new TextField(onChanged: appContext.updateTitle),
            new RaisedButton(
              onPressed: appContext.changeTheme,
              child: new Text("change theme"),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: appContext.increment,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
