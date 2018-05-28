import 'package:flutter_study/mvp/presenter/FLPresenter.dart';
import 'package:flutter_study/mvp/repository/FLRepositoryImlp.dart';

class FLPresenterImpl implements FLPresenter {
  FLView _view;

  FLRepositoryImlp _repository;

  FLPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  void loadFLData(int pageNum, int pageSize) {
    assert(_view != null);

    _repository.fetch(pageNum,pageSize).then((data) {
      _view.onloadFLSuc(data);
    }).catchError((error) {
      print(error);
      _view.onloadFLFail();
    });
  }

  @override
  init() {
    _repository = new FLRepositoryImlp();
  }
}
