import 'dart:async';
import 'package:flutter_study/model/FLModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_study/common/Constant.dart';
import 'package:flutter_study/mvp/repository/FLRepository.dart';

class FLRepositoryImlp implements FLRepository {
  @override
  Future<List<FLModel>> fetch(int pageNum,int pageSize) {
    return _getData(pageNum,pageSize);
  }
}


Future<List<FLModel>> _getData(int pageNum,int pageSize) async {
  var httpClient = new HttpClient();
  var url = Constant.baseUrl + '福利/$pageSize/$pageNum';

  print(url);

  List flModels;
  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(UTF8.decoder).join();
      flModels = jsonDecode(json)['results'];
    } else {
      //todo
    }
  } catch (exception) {
    //todo
  }

  return flModels.map((model) {
    return new FLModel(url: model['url']);
  }).toList();
}



