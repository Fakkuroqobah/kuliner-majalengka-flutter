import 'package:mobx/mobx.dart';

import '../../services/menu_service.dart';
import '../../models/menu_model.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuController with _$MenuController;

abstract class _MenuController with Store {
  final MenuService _menuService = MenuService();

  @observable
  ObservableFuture<List<MenuModel>> _menusRandom;
  ObservableFuture<List<MenuModel>> get menusRandom => _menusRandom;

  @observable
  ObservableFuture<List<MenuModel>> _menus;
  ObservableFuture<List<MenuModel>> get menus => _menus;

  @observable
  int _lastPage;
  int get lastPage => _lastPage;

  @action
  ObservableFuture<List<MenuModel>> random() { 
    return _menusRandom = ObservableFuture(_menuService.random().then((List<MenuModel> menus) => menus)); 
  }

  @action
  ObservableFuture<List<MenuModel>> all({String page = "1"}) {
    return _menus = ObservableFuture(_menuService.all(page: page).then((List<MenuModel> menus) {
      _lastPage = _menuService.lastPage;
      return menus;
    }));
  }
}