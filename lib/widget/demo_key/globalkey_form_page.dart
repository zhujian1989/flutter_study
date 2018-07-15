import 'package:flutter/material.dart';

class GlobalKeyFromPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GlobalKeyFromPageState();
  }
}

class _GlobalKeyFromPageState extends State<GlobalKeyFromPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("GlobalKey"),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new FormOnePage(scaffoldKey),
        ],
      ),
    );
  }
}

class FormOnePage extends StatefulWidget {

  final _key;

  FormOnePage(this._key);

  @override
  State<StatefulWidget> createState() {
    return new _FormOnePageState();
  }
}

class _FormOnePageState extends State<FormOnePage> {
  final formKey = GlobalKey<FormState>();


  String _phoneNum;

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  decoration: new InputDecoration(
                    hintText: '请输入手机号',
                  ),
                  maxLines: 1,
                  maxLength: 11,
                  //键盘展示为号码
                  keyboardType: TextInputType.phone,
                  validator: (str) {
                    return str.isEmpty?"手机号不能为空":null;
                  },
                  onSaved: (str) {
                    _phoneNum = str;
                  },
                ),
                RaisedButton(
                  child: Text( "提交"),
                  onPressed: onPressed,
                ),
              ],
            )));
  }

  void onPressed() {
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      var snackBar = SnackBar(content: Text('phone: $_phoneNum'));

      widget._key.currentState.showSnackBar(snackBar);

    }
  }
}

class FormTwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FormTwoPageState();
  }
}

class _FormTwoPageState extends State<FormOnePage> {
  @override
  Widget build(BuildContext context) {
    return new Text("form b");
  }
}
