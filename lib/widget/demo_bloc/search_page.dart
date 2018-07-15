import 'package:flutter/material.dart';
import 'package:flutter_study/model/search_model.dart';
import 'package:flutter_study/widget/demo_bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc searchBloc;

  @override
  void initState() {
    searchBloc = new SearchBloc(new SearchApi());
    super.initState();
  }

  @override
  void dispose() {
    searchBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('BLoC'),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new Text('索索如下关键字，查10条数据\n福利 | Android | iOS | 休息视频 | 拓展资源 | 前端 | all'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                onChanged: searchBloc.query.add,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
              ),
            ),
            StreamBuilder(
              stream: searchBloc.log,
              builder: (context, snapshot) => Container(
                    child: Text(snapshot?.data ?? ''),
                  ),
            ),
            Flexible(
              child: StreamBuilder(
                stream: searchBloc.results,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(snapshot.data[index].desc),
                        ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}


