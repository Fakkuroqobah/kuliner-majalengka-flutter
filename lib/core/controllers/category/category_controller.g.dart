// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryController, Store {
  final _$_categoriesRandomAtom =
      Atom(name: '_CategoryController._categoriesRandom');

  @override
  ObservableFuture<List<CategoryModel>> get _categoriesRandom {
    _$_categoriesRandomAtom.reportRead();
    return super._categoriesRandom;
  }

  @override
  set _categoriesRandom(ObservableFuture<List<CategoryModel>> value) {
    _$_categoriesRandomAtom.reportWrite(value, super._categoriesRandom, () {
      super._categoriesRandom = value;
    });
  }

  final _$_CategoryControllerActionController =
      ActionController(name: '_CategoryController');

  @override
  ObservableFuture<List<CategoryModel>> random() {
    final _$actionInfo = _$_CategoryControllerActionController.startAction(
        name: '_CategoryController.random');
    try {
      return super.random();
    } finally {
      _$_CategoryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
