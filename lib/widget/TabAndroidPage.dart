import 'package:flutter/material.dart';
import 'package:flutter_study/model/AIModel.dart';
import 'package:flutter_study/mvp/presenter/AIPresenter.dart';
import 'package:flutter_study/mvp/presenter/AIPresenterImpl.dart';

class AndroidAppPage extends StatefulWidget {
  AndroidAppPage({Key key}) : super(key: key);

  @override
  _AndroidAppPageState createState() {
    _AndroidAppPageState view = new _AndroidAppPageState();
    AIPresenterImpl presenter = new AIPresenterImpl(view);
    presenter.init();
    return view;
  }
}

class _AndroidAppPageState extends State<AndroidAppPage> implements AIView {
  List<AIModel> datas = [];

  AIPresenterImpl _alPresenter;

  @override
  void initState() {
    super.initState();
    _loadData(1, 10);
  }

  _loadData(int pageNum, int pageSize) {
    _alPresenter.loadAIData("Android", 1, 10);
  }

  @override
  Widget build(BuildContext context) {
    var content;

    if (datas == null) {
      content = new Center(
        // 可选参数 child:
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: datas.length,
        itemBuilder: buildItem,
      );
    }

    return content;
  }

  Widget buildItem(BuildContext context, int index) {
    final AIModel item = datas[index];
    return new ListTile(
      title: new Text(item.desc), //子item的标题
      trailing: new Icon(Icons.arrow_right,color: Colors.green,),//显示右侧的箭头，不显示则传null
    );

  }

  @override
  void onloadFLFail() {
    // TODO: implement onloadFLFail
  }

  @override
  void onloadFLSuc(List<AIModel> list) {
    setState(() {
      datas = list;
    });
  }

  @override
  setPresenter(AIPresenter presenter) {
    // TODO: implement setPresenter
    _alPresenter = presenter;
  }
}

class TabAndroidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new AndroidAppPage(),
    );
  }
}
