import 'package:mobx/mobx.dart';

part 'loading_scroll_controller.g.dart';

class LoadingScrollController = _LoadingScrollController with _$LoadingScrollController;

abstract class _LoadingScrollController with Store {
  @observable
  bool _loading = false;
  bool get loading => _loading;

  @action
  void isLoading(bool loading) {
    _loading = loading;
  }
}