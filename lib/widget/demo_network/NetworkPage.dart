import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/Constant.dart';
import 'package:flutter_study/model/AIModel.dart';
import 'package:flutter_study/model/HotNewsModel.dart';
import 'package:http/http.dart' as http;

class NetworkAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NetworkAppPageState();
  }
}

class _NetworkAppPageState extends State<NetworkAppPage> {
  var _result = '';
  var _decodeResult = '';

  //使用系统的请求
  var httpClient = new HttpClient();

  var dio_url = 'https://news-at.zhihu.com/api/4/news/latest';
  var url = Constant.baseUrl + 'Android/1/1';

  _loadData() async {
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        _result = await response.transform(UTF8.decoder).join();
        _decodeJson(_result, false);
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = '网络异常';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  //使用第三方库Http的请求
  var client = new http.Client();

  _loadDataByHttp() async {
    try {
      http.Response response = await client.get(url);
      if (response.statusCode == HttpStatus.OK) {
        if (response.statusCode == HttpStatus.OK) {
          _result = response.body.toString();
          _decodeJson(_result, false);
        } else {
          _result = 'error code : ${response.statusCode}';
        }
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = '网络异常';
    }

    setState(() {});
  }

  //使用第三方库Dio的请求
  Dio dio = new Dio();

  _loadDataByDio() async {
    try {
      Response response = await dio.get(dio_url);
      if (response.statusCode == HttpStatus.OK) {
        _result = response.data.toString();
        _decodeTest(response.data);
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      print('exc:$exception');
      _result = '网络异常';
    }

    setState(() {});
  }


  _decodeTest(var body) {

    String date = body['date'];

    List stories = body['stories'];

    List topStories = body['top_stories'];

    List<HotNewsStoriesModel> storiesList = stories.map((model) {
      return new HotNewsStoriesModel.fromJson(model);
    }).toList();


    List<HotNewsTopStoriesModel> topStoriesList = topStories.map((model) {
      return new HotNewsTopStoriesModel.fromJson(model);
    }).toList();

    HotNewsModel hotNewsModel = new HotNewsModel(
        date: date, stories: storiesList, top_stories: topStoriesList);

    print(topStoriesList.length);

    print(storiesList.length);


    storiesList.forEach((model) => print('${model.images}:${model.id}:${model.title}:${model.type}'));


  }


  _decodeJson(var body, bool isDio) {
    var json;

    if (isDio) {
      //如果是Dio则不需要jsonDecode
      json = body;
    } else {
      json = jsonDecode(body);
    }

    List flModels = json['results'];

    List<AIModel> list = flModels.map((model) {
      return new AIModel.fromJson(model);
    }).toList();

    for (AIModel model in list) {
      _decodeResult =
          '作者：${model.who}\n描述：${model.desc}\n地址：${model.url}\n时间：${DateTime.parse(
          model.publishedAt)}';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络请求 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('不使用第三方库加载数据'),
                onPressed: _loadData),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('使用第三方库http加载数据'),
                onPressed: _loadDataByHttp),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('使用第三方库dio加载数据'),
                onPressed: _loadDataByDio),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('原始数据：\n$_result'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('解析后的数据：\n$_decodeResult'),
          ),
        ],
      ),
    );
  }
}

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new NetworkAppPage(),
    );
  }
}
