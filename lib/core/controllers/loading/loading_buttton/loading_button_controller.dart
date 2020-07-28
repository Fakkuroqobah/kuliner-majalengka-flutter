import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../ui/constants/style.dart';

part 'loading_button_controller.g.dart';

class LoadingButtonController = _LoadingButtonController with _$LoadingButtonController;

abstract class _LoadingButtonController with Store {
  @observable
  String _loading = "";
  String get loading => _loading;

  @observable
  Color _bgLoading = Style.primary;
  Color get bgLoading => _bgLoading;

  @observable
  bool _disabled = false;
  bool get disabled => _disabled;

  @action
  void isLoading(String text, Color color, bool disabled) {
    _bgLoading = color;
    _loading = text;
    _disabled = disabled;
  }
}