import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study/util/DatabaseHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

String username = '';

String pwd = '';

const String USERNAME = 'username';

const String PWD = 'pwd';

class DataAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DataAppPageState();
  }
}

class _DataAppPageState extends State<DataAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数据存储 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('对用户名和密码进行增删改查的操作'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new LoginWidget(),
          ),
          new Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: new HandleSPDataWidget(),
          ),
          new Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: new HandleSQLiteDataWidget(),
          ),
          new Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: new HandleFileDataWidget(),
          ),
        ],
      ),
    );
  }
}

class HandleSPDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HandleSPDataWidgetState();
  }
}

class _HandleSPDataWidgetState extends State<HandleSPDataWidget> {
  var _result;

  _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (username.isEmpty || pwd.isEmpty) {
      setState(() {
        showDialog<Null>(
          context: context,
          child: new AlertDialog(
              content: new Text('用户名和密码不能为空'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('确定'))
              ]),
        );
      });

      return;
    }

    prefs.setString(USERNAME, username);

    prefs.setString(PWD, pwd);

    setState(() {
      _result = '_add 成功 请点击查验证结果';
    });
  }

  _delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //KEY
    prefs.remove(USERNAME);
    prefs.remove(PWD);

    //清空所有KEY
    //prefs.clear();

    setState(() {
      _result = '_delete 成功, 请点击查验证结果';
    });
  }

  _update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(USERNAME, 'Paul');

    prefs.setString(PWD, '654321');

    setState(() {
      _result = '_update 成功，用户名修改为Paul，密码修改为654321, 请点击查验证结果';
    });
  }

  _query() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String username = prefs.get(USERNAME);

    String pwd = prefs.get(PWD);

    print('$username');

    print('$pwd');

    setState(() {
      _result = '_query 成功: username: $username pwd: $pwd';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('shared_preferences用法'),
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black, child: new Text('增'), onPressed: _add),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('删'),
                onPressed: _delete),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('改'),
                onPressed: _update),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查'),
                onPressed: _query),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('结果：$_result'),
        ),
      ],
    );
  }
}

class HandleSQLiteDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HandleSQLiteDataWidgetState();
  }
}

class _HandleSQLiteDataWidgetState extends State<HandleSQLiteDataWidget> {
  // TODO: implement build

  String dbName = 'user.db';
  String dbPath;

  String sql_createTable =
      'CREATE TABLE user_table (id INTEGER PRIMARY KEY, username TEXT,pwd Text)';

  String sql_query_count = 'SELECT COUNT(*) FROM user_table';

  String sql_query = 'SELECT * FROM user_table';

  var databaseHelper = new DatabaseHelper();

  var _result;

  _create() async {
    dbPath = await databaseHelper.createNewDb(dbName);
    Database db = await openDatabase(dbPath);

    await db.execute(sql_createTable);
    await db.close();
    setState(() {
      _result = '创建user.db成功，创建user_table成功';
    });
  }

  _add() async {
    if (username.isEmpty || pwd.isEmpty) {
      setState(() {
        showDialog<Null>(
          context: context,
          child: new AlertDialog(
              content: new Text('用户名和密码不能为空'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('确定'))
              ]),
        );
      });

      return;
    }

    Database db = await openDatabase(dbPath);

    String sql =
        "INSERT INTO user_table(username,pwd) VALUES('$username','$pwd')";
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });

    await db.close();

    setState(() {
      _result = "插入username=$username,pwd=$pwd数据成功";
    });
  }

  _delete() async {
    Database db = await openDatabase(dbPath);

    String sql = "DELETE FROM user_table WHERE id = ?";

    int count = await db.rawDelete(sql, ['1']);

    await db.close();

    setState(() {
      if (count == 1) {
        _result = "删除成功，请查看";
      } else {
        _result = "删除失败，请看log";
      }
    });
  }

  _update() async {
    Database db = await openDatabase(dbPath);
    String sql = "UPDATE user_table SET pwd = ? WHERE id = ?";
    int count = await db.rawUpdate(sql, ["654321", '1']);
    print(count);
    await db.close();
    setState(() {
      _result = "更新数据成功，请查看";
    });
  }

  _queryNum() async {
    Database db = await openDatabase(dbPath);
    int count = Sqflite.firstIntValue(await db.rawQuery(sql_query_count));
    await db.close();
    setState(() {
      _result = "数据条数：$count";
    });
  }

  _query() async {
    Database db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery(sql_query);
    await db.close();
    setState(() {
      _result = "数据详情：$list";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('sqflite用法'),
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('创建'),
                onPressed: _create),
            new RaisedButton(
                textColor: Colors.black, child: new Text('增'), onPressed: _add),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('删'),
                onPressed: _delete),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('改'),
                onPressed: _update),
          ],
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查条数'),
                onPressed: _queryNum),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查详情'),
                onPressed: _query),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('结果：$_result'),
        ),
      ],
    );
  }
}

class HandleFileDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HandleFileDataWidgetState();
  }
}

class _HandleFileDataWidgetState extends State<HandleFileDataWidget> {
  // TODO: implement build

  String tempPath;

  String appDocPath;

  String sdCardPath;

  var _result;

  _add() async {
    if (username.isEmpty || pwd.isEmpty) {
      setState(() {
        showDialog<Null>(
          context: context,
          child: new AlertDialog(
              content: new Text('用户名和密码不能为空'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text('确定'))
              ]),
        );
      });

      return;
    }

    File file = new File('$tempPath/user.txt');
    await file.writeAsString('用户名:$username\n密码:$pwd');
    setState(() {
      _result = '写入成功，请查询';
    });
  }

  _delete() {
    File file = new File('$tempPath/user.txt');
    file.deleteSync(recursive: false);
    setState(() {
      _result = '删除成功，请查看';
    });
  }

  _update() async {
    File file = new File('$tempPath/user.txt');
    await file.writeAsString('用户名:Paul\n密码:654321');
    setState(() {
      _result = '修改成功，请查询';
    });
  }

  _query() async {
    try {
      File file = new File('$tempPath/user.txt');
      _result = '查询成功\n' + await file.readAsString();
    } on Exception catch (e) {
      _result = ' exception: $e';
    }

    setState(() {});
  }

  void _requestTempDirectory() async {
    Directory tempDir = await getTemporaryDirectory();
    setState(() {
      tempPath = tempDir.path;
    });
  }

  void _requestAppDocumentsDirectory() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    setState(() {
      appDocPath = appDocDir.path;
    });
  }

  void _requestExternalStorageDirectory() async {
    Directory sdCardDir = await getExternalStorageDirectory();
    setState(() {
      sdCardPath = sdCardDir.path;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _requestTempDirectory();

    _requestAppDocumentsDirectory();

    _requestExternalStorageDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('文件用法'),
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black, child: new Text('增'), onPressed: _add),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('删'),
                onPressed: _delete),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('改'),
                onPressed: _update),
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查'),
                onPressed: _query),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('结果：$_result'),
        ),
        new Text('缓存文件路径:'),
        new Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: new Text('$tempPath'),
        ),
        new Text('应用文件路径:'),
        new Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: new Text('$appDocPath'),
        ),
        new Text('Android SD卡路径:'),
        new Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: new Text('$sdCardPath'),
        ),
      ],
    );
  }
}

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var node = new FocusNode();
    return new Column(
      children: <Widget>[
        new TextField(
          onChanged: (str) {
            username = str;
            print(username);
          },
          decoration: new InputDecoration(
            labelText: '用户名',
            hintText: '请输入英文或数字',
          ),
          maxLines: 1,
          onSubmitted: (text) {
            FocusScope.of(context).reparentIfNeeded(node);
          },
        ),
        new TextField(
          onChanged: (text) {
            pwd = text;
            print(pwd);
          },
          obscureText: true,
          maxLines: 1,
          decoration:
              new InputDecoration(hintText: '请输入长度大于6的密码', labelText: '密码'),
          keyboardType: TextInputType.text,
          onSubmitted: (text) {},
        ),
      ],
    );
  }
}

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new DataAppPage(),
    );
  }
}
