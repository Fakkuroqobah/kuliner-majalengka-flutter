// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantController on _RestaurantController, Store {
  final _$_restaurantsRandomAtom =
      Atom(name: '_RestaurantController._restaurantsRandom');

  @override
  ObservableFuture<List<RestaurantModel>> get _restaurantsRandom {
    _$_restaurantsRandomAtom.reportRead();
    return super._restaurantsRandom;
  }

  @override
  set _restaurantsRandom(ObservableFuture<List<RestaurantModel>> value) {
    _$_restaurantsRandomAtom.reportWrite(value, super._restaurantsRandom, () {
      super._restaurantsRandom = value;
    });
  }

  final _$_RestaurantControllerActionController =
      ActionController(name: '_RestaurantController');

  @override
  ObservableFuture<List<RestaurantModel>> random() {
    final _$actionInfo = _$_RestaurantControllerActionController.startAction(
        name: '_RestaurantController.random');
    try {
      return super.random();
    } finally {
      _$_RestaurantControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
