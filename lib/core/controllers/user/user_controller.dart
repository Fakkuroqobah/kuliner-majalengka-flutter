import 'package:mobx/mobx.dart';

import '../../utils/injector.dart';
import '../../utils/navigation.dart';
import '../../services/user_service.dart';
import '../../models/detail_model.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final UserService _userService = UserService();

  @observable
  String _errorsOnLogin = "";
  String get errorsOnLogin => _errorsOnLogin;

  @observable
  Map<String, dynamic> _errorsOnRegister;
  Map<String, dynamic> get errorsOnRegister => _errorsOnRegister;

  @observable
  ObservableFuture<DetailModel> _detail;
  ObservableFuture<DetailModel> get detail => _detail;

  @action
  Future<Null> login(String email, String password) {
    _errorsOnLogin = "";
    return _userService.login(email, password).then((bool value) {
      if(value) {
        locator<Navigation>().navigateRemoveUntilTo('home');
      }else{
        _errorsOnLogin = _userService.errorsOnLogin;
      }
    });
  }

  @action
  Future<Null> register(Map<String, dynamic> data) {
    return _userService.register(data).then((bool value) {
      if(value) {
        locator<Navigation>().navigateRemoveUntilTo('home');
      }else{
        _errorsOnRegister = _userService.errorsOnRegister;
      }
    });
  }

  @action
  ObservableFuture<DetailModel> details() {
    return _detail = ObservableFuture(_userService.details().then((DetailModel value) => value));
  }

  @action
  Future<dynamic> logout() {
    return _userService.logout().then((_) =>
      locator<Navigation>().navigateRemoveUntilTo('login')
    );
  }
}