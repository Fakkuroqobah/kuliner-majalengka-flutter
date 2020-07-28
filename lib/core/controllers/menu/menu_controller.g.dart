// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuController on _MenuController, Store {
  final _$_menusRandomAtom = Atom(name: '_MenuController._menusRandom');

  @override
  ObservableFuture<List<MenuModel>> get _menusRandom {
    _$_menusRandomAtom.reportRead();
    return super._menusRandom;
  }

  @override
  set _menusRandom(ObservableFuture<List<MenuModel>> value) {
    _$_menusRandomAtom.reportWrite(value, super._menusRandom, () {
      super._menusRandom = value;
    });
  }

  final _$_menusAtom = Atom(name: '_MenuController._menus');

  @override
  ObservableFuture<List<MenuModel>> get _menus {
    _$_menusAtom.reportRead();
    return super._menus;
  }

  @override
  set _menus(ObservableFuture<List<MenuModel>> value) {
    _$_menusAtom.reportWrite(value, super._menus, () {
      super._menus = value;
    });
  }

  final _$_lastPageAtom = Atom(name: '_MenuController._lastPage');

  @override
  int get _lastPage {
    _$_lastPageAtom.reportRead();
    return super._lastPage;
  }

  @override
  set _lastPage(int value) {
    _$_lastPageAtom.reportWrite(value, super._lastPage, () {
      super._lastPage = value;
    });
  }

  final _$_MenuControllerActionController =
      ActionController(name: '_MenuController');

  @override
  ObservableFuture<List<MenuModel>> random() {
    final _$actionInfo = _$_MenuControllerActionController.startAction(
        name: '_MenuController.random');
    try {
      return super.random();
    } finally {
      _$_MenuControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableFuture<List<MenuModel>> all({String page = "1"}) {
    final _$actionInfo = _$_MenuControllerActionController.startAction(
        name: '_MenuController.all');
    try {
      return super.all(page: page);
    } finally {
      _$_MenuControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
