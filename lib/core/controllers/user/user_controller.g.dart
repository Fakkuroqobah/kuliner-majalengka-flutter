// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  final _$_errorsOnLoginAtom = Atom(name: '_UserController._errorsOnLogin');

  @override
  String get _errorsOnLogin {
    _$_errorsOnLoginAtom.reportRead();
    return super._errorsOnLogin;
  }

  @override
  set _errorsOnLogin(String value) {
    _$_errorsOnLoginAtom.reportWrite(value, super._errorsOnLogin, () {
      super._errorsOnLogin = value;
    });
  }

  final _$_errorsOnRegisterAtom =
      Atom(name: '_UserController._errorsOnRegister');

  @override
  Map<String, dynamic> get _errorsOnRegister {
    _$_errorsOnRegisterAtom.reportRead();
    return super._errorsOnRegister;
  }

  @override
  set _errorsOnRegister(Map<String, dynamic> value) {
    _$_errorsOnRegisterAtom.reportWrite(value, super._errorsOnRegister, () {
      super._errorsOnRegister = value;
    });
  }

  final _$_detailAtom = Atom(name: '_UserController._detail');

  @override
  ObservableFuture<DetailModel> get _detail {
    _$_detailAtom.reportRead();
    return super._detail;
  }

  @override
  set _detail(ObservableFuture<DetailModel> value) {
    _$_detailAtom.reportWrite(value, super._detail, () {
      super._detail = value;
    });
  }

  final _$_UserControllerActionController =
      ActionController(name: '_UserController');

  @override
  Future<Null> login(String email, String password) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.login');
    try {
      return super.login(email, password);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Null> register(Map<String, dynamic> data) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.register');
    try {
      return super.register(data);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableFuture<DetailModel> details() {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.details');
    try {
      return super.details();
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> logout() {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.logout');
    try {
      return super.logout();
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
