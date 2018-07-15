import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_study/common/widget/progreess_dialog.dart';
import 'package:flutter_study/model/base_model.dart';
import 'package:flutter_study/model/search_model.dart';

class StreamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StreamPageState();
  }
}

class _StreamPageState extends State<StreamPage> {
  List<SearchModel> _list = [];

  StreamController<List<SearchModel>> _streamController;

  SearchApi _api = new SearchApi();

  _initStreamController() {
    _streamController = StreamController.broadcast();
    _streamController.stream.listen((list) {
      _list.addAll(list);
      setState(() {});
    });
  }

  _loadData() async {
    _api.getSearchResult('all').asStream().map((value) => (!value
        .error && null != value.results && value.results.length > 0) ? value
        .results : null).pipe(_streamController);
  }

  @override
  void initState() {
    super.initState();
    _initStreamController();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
    _streamController = null;
  }

  Widget _build(BuildContext context) {
    if (_list.isEmpty) {
      return getProgressDialog();
    } else {
      return ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) => _buildItem(index));
    }
  }

  Widget _buildItem(int index) {
    SearchModel model = _list[index];
    return new Text('$index. ${model.desc}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StreamController"),
        centerTitle: true,
      ),
      body: new Center(
        child: _build(context),
      ),
    );
  }
}
