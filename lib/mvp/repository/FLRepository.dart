

import 'dart:async';
import 'package:flutter_study/model/FLModel.dart';


abstract class FLRepository{
  Future<List<FLModel>> fetch(int pageNum,int pageSize);
}
