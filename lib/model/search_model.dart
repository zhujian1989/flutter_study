import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_study/util/dio_factory.dart';

class SearchModel {
  final String desc;
  final String publishedAt;
  final String url;
  final String who;

  const SearchModel({this.desc, this.publishedAt, this.url, this.who});

  SearchModel.fromJson(Map<String, dynamic> json)
      : desc = json['desc'],
        publishedAt = json['publishedAt'],
        url = json['url'],
        who = json['who'];
}

class SearchApi {
  final Dio _dio = DioFactory.getInstance().getDio();

  static const String _url =
      "http://gank.io/api/search/query/listview/category/{type}/count/10/page/1";

  Future<List<SearchModel>> getSearchResult(String type) async {
    Response response = await _dio.get(_url.replaceFirst('{type}', type));

    List<SearchModel> list;

    if (response.statusCode == HttpStatus.OK) {
      bool error = response.data['error'];
      if (!error) {
        List searchModels = response.data['results'];
        list = searchModels.map((model) {
          return new SearchModel.fromJson(model);
        }).toList();
      }
    }

    return list;
  }
}
