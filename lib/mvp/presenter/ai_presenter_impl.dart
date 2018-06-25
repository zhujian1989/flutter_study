import 'package:flutter_study/mvp/presenter/ai_presenter.dart';
import 'package:flutter_study/mvp/repository/ai_repository_imlp.dart';
import 'package:flutter_study/mvp/repository/ai_repository.dart';

class AIPresenterImpl implements AIPresenter {
  AIView _view;

  AIRepository _repository;

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
