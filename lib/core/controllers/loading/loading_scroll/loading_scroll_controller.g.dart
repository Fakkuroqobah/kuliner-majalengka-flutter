// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_scroll_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadingScrollController on _LoadingScrollController, Store {
  final _$_loadingAtom = Atom(name: '_LoadingScrollController._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_LoadingScrollControllerActionController =
      ActionController(name: '_LoadingScrollController');

  @override
  void isLoading(bool loading) {
    final _$actionInfo = _$_LoadingScrollControllerActionController.startAction(
        name: '_LoadingScrollController.isLoading');
    try {
      return super.isLoading(loading);
    } finally {
      _$_LoadingScrollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
