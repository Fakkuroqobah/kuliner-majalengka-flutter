import 'package:dio/dio.dart';

import '../configs/api.dart';
import '../models/menu_model.dart';

class MenuService {
  final _dio = Dio();

  Future<List<MenuModel>> random() async {
    try{
      final response = await _dio.get(Api.menusRandom);
      List<MenuModel> _menus = [];

      response.data['data'].forEach((val) {
        _menus.add(MenuModel.fromJson(val));
      });

      return _menus;
    }catch(error){
      throw Exception(error.toString());
    }
  }

  int _lastPage = 1;
  int get lastPage => _lastPage;
  
  List<MenuModel> _menus = [];

  Future<List<MenuModel>> all({String page}) async {
    try{
      final response = await _dio.get("${Api.menus}?page=$page");

      if(_lastPage == 1) {
        response.data['data']['data'].forEach((val) {
          _menus.add(MenuModel.fromJson(val));
        });
      }else{
        List<MenuModel> _new = [];
        response.data['data']['data'].forEach((val) {
          _new.add(MenuModel.fromJson(val));
        });

        _menus.addAll(_new);
      }

      _lastPage = response.data['data']['last_page'];

      return _menus;
    }catch(error){
      print(error);
      throw Exception(error);
    }
  }
}