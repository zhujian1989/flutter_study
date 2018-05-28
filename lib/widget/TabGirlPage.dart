import 'package:flutter/material.dart';
import 'package:flutter_study/model/FLModel.dart';
import 'package:flutter_study/mvp/presenter/FLPresenterImpl.dart';
import 'package:flutter_study/mvp/presenter/FLPresenter.dart';

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() {
    _SampleAppPageState view = new _SampleAppPageState();
    FLPresenterImpl presenter = new FLPresenterImpl(view);
    presenter.init();
    return view;
  }
}

class _SampleAppPageState extends State<SampleAppPage> implements FLView {
  List<FLModel> datas = [];

  FLPresenterImpl _flPresenter;

  @override
  void initState() {
    super.initState();
    _loadData(1, 10);
  }

  _loadData(int pageNum,int pageSize){
    _flPresenter.loadFLData(1, 10);
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
        itemBuilder: buildCard,
      );
    }

    return content;
  }

  Widget buildCard(BuildContext context, int index) {
    final String item = datas[index].url;
    return new Card(
      child: new Image.network(item),
    );
  }

  @override
  void onloadFLFail() {
    // TODO: implement onloadFLFail
  }

  @override
  void onloadFLSuc(List<FLModel> list) {
    setState(() {
      datas = list;
    });
  }

  @override
  setPresenter(FLPresenter presenter) {
    // TODO: implement setPresenter
    _flPresenter = presenter;
  }
}

class TabGirlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new SampleAppPage(),
    );
  }
}
