import 'package:flutter_study/model/FLModel.dart';
import 'package:flutter_study/mvp/Mvp.dart';


abstract class FLPresenter implements IPresenter{
  loadFLData(int pageNum,int pageSize);
}


abstract class FLView implements IView<FLPresenter>{
  void onloadFLSuc(List<FLModel> list);
  void onloadFLFail();
}
