import 'package:dio/dio.dart';

//总觉得怪怪的，但是打印出来确实是只有一个dio对象。。

class DioFactory {
  static Dio _dio;

  static DioFactory _instance;

  static DioFactory getInstance() {
    if (_instance == null) {
      _instance = new DioFactory._();
      _instance._init();
    }
    return _instance;
  }

  DioFactory._();

  _init(){
    _dio = new Dio();
  }

  getDio() {
    return _dio;
  }
}

//测试是否是单例
void main() {
  print(DioFactory.getInstance().getDio()  == DioFactory.getInstance().getDio());
}
