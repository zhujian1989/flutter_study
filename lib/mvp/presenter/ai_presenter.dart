import 'package:flutter_study/model/ai_model.dart';
import 'package:flutter_study/mvp/mvp.dart';


abstract class AIPresenter implements IPresenter{
  loadAIData(String type,int pageNum,int pageSize);
}


abstract class AIView implements IView<AIPresenter>{
  void onloadFLSuc(List<AIModel> list);
  void onloadFLFail();
}
