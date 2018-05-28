import 'package:flutter_study/mvp/presenter/AIPresenter.dart';
import 'package:flutter_study/mvp/repository/AIRepositoryImlp.dart';

class AIPresenterImpl implements AIPresenter {
  AIView _view;

  AIRepositoryImlp _repository;

  AIPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  void loadAIData(String type, int pageNum, int pageSize) {
    assert(_view != null);

    _repository.fetch(type, pageNum, pageSize).then((data) {
      _view.onloadFLSuc(data);
    }).catchError((error) {
      print(error);
      _view.onloadFLFail();
    });
  }

  @override
  init() {
    _repository = new AIRepositoryImlp();
  }
}
