// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadingButtonController on _LoadingButtonController, Store {
  final _$_loadingAtom = Atom(name: '_LoadingButtonController._loading');

  @override
  String get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(String value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_bgLoadingAtom = Atom(name: '_LoadingButtonController._bgLoading');

  @override
  Color get _bgLoading {
    _$_bgLoadingAtom.reportRead();
    return super._bgLoading;
  }

  @override
  set _bgLoading(Color value) {
    _$_bgLoadingAtom.reportWrite(value, super._bgLoading, () {
      super._bgLoading = value;
    });
  }

  final _$_disabledAtom = Atom(name: '_LoadingButtonController._disabled');

  @override
  bool get _disabled {
    _$_disabledAtom.reportRead();
    return super._disabled;
  }

  @override
  set _disabled(bool value) {
    _$_disabledAtom.reportWrite(value, super._disabled, () {
      super._disabled = value;
    });
  }

  final _$_LoadingButtonControllerActionController =
      ActionController(name: '_LoadingButtonController');

  @override
  void isLoading(String text, Color color, bool disabled) {
    final _$actionInfo = _$_LoadingButtonControllerActionController.startAction(
        name: '_LoadingButtonController.isLoading');
    try {
      return super.isLoading(text, color, disabled);
    } finally {
      _$_LoadingButtonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
