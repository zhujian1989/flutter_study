import 'dart:async';
import 'package:flutter_study/model/FLModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_study/common/Constant.dart';
import 'package:flutter_study/mvp/repository/FLRepository.dart';
//分类数据: http://gank.io/api/data/数据类型/请求个数/第几页
//数据类型： 福利 | Android | iOS | 休息视频 | 拓展资源 | 前端 | all
//请求个数： 数字，大于0
//第几页：数字，大于0
//@param rows
//@param pageNum
//@return


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



