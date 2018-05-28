import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List datas = [];

  _getFLData() async {

    var url = 'http://gank.io/api/data/福利/10/1';

    var httpClient = new HttpClient();

    List result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        result = jsonDecode(json)['results'];
      } else {
        //todo
      }
    } catch (exception) {
      //todo
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      datas = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _getFLData();
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

  Widget buildCard(BuildContext context,int index){
    final String item = datas[index]['url'];
    return new Card(
      child: new Image.network(item),
    );
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
