import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_study/common/Constant.dart';
import 'package:flutter_study/model/AIModel.dart';
import 'package:flutter_study/mvp/repository/AIRepository.dart';

class AIRepositoryImlp implements AIRepository {
  @override
  Future<List<AIModel>> fetch(String type, int pageNum, int pageSize) {
    return _getData(type, pageNum, pageSize);
  }
}

Future<List<AIModel>> _getData(String type, int pageNum, int pageSize) async {
  var httpClient = new HttpClient();
  var url = Constant.baseUrl + '$type/$pageSize/$pageNum';

  print(url);

  List aiModels;

  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(UTF8.decoder).join();
      aiModels = jsonDecode(json)['results'];

    } else {
      //todo
    }
  } catch (exception) {
    //todo
  }

  return aiModels.map((model) {
    return new AIModel(
        desc: model['desc'],
        images: model['images'],
        publishedAt: model['publishedAt'],
        url: model['url'],
        who: model['who']);
  }).toList();
}


