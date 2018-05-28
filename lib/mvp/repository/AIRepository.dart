

import 'dart:async';
import 'package:flutter_study/model/AIModel.dart';


abstract class AIRepository{
  Future<List<AIModel>> fetch(String type,int pageNum,int pageSize);
}
