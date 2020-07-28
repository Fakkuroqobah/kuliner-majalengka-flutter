import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/api.dart';
import '../utils/logging_interceptors.dart';
import '../utils/injector.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../models/detail_model.dart';

class UserService {
  final SharedPreferences _preferences = locator<SharedPreferences>();
  final Dio _dio = Dio();

  UserService() {
    _dio.interceptors.add(LoggingInterceptors(_dio));
  }

  String _errorsOnLogin = "";
  String get errorsOnLogin => _errorsOnLogin;

  Future<bool> login(String txtEmail, String txtPassword) async {
    try{
      final response = await _dio.post(
        Api.login, 
        data: {
          "user_email": txtEmail,
          "user_password": txtPassword
        },
        options: Options(validateStatus: (status) => status < 500)
      );
      
      if(response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);

        _preferences.setString("userToken", loginModel.accessToken);
        _preferences.setInt("userId", loginModel.user.idUser);
        _preferences.setString("userEmail", loginModel.user.userEmail);
        _preferences.setString("userName", loginModel.user.userName);
        _preferences.setString("userImage", loginModel.user.userImage);

        return true;
      }else{
        _errorsOnLogin = response.data["message"];
        return false;
      }
    }catch(error){
      throw Exception(error);
    }
  }

  Map<String, dynamic> _errorsOnRegister;
  Map<String, dynamic> get errorsOnRegister => _errorsOnRegister;

  Future<bool> register(Map<String, String> data) async {
    try{
      var response = await _dio.post(
        Api.register,
        data: {
          "user_name": data['username'],
          "user_email": data['email'],
          "user_password": data['password'],
          "confirm_password": data['confirmPassword'],
        },
        options: Options(validateStatus: (status) => status < 500)
      );

      RegisterModel registerModel = RegisterModel.fromJson(response.data);

      if(response.statusCode == 201) {
        _preferences.setString("userToken", registerModel.data.token);

        try {
          final response = await _dio.get(Api.details, options: Options(
            headers: { "Authorization": "Bearer ${_preferences.getString("userToken")}" },
            validateStatus: (status) => status < 500
          ));

          DetailModel detailModel = DetailModel.fromJson(response.data);

          _preferences.setInt("userId", detailModel.data.user.idUser);
          _preferences.setString("userEmail", detailModel.data.user.userEmail);
          _preferences.setString("userName", detailModel.data.user.userName);
          _preferences.setString("userImage", detailModel.data.user.userImage);

          return true;
        } catch(error) {
          throw Exception(error);
        }

      }else if(response.statusCode == 422) {
        _errorsOnRegister = response.data["data"]["error"];
        return false;
      }

      return false;
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<String> refresh() async {
    print('refresh');
    try{
      final response = await _dio.post(Api.refresh, options: Options(
        headers: { 'requirestoken': true },
      ));

      return response.data['refresh_token'];
    } catch(error) {
      throw Exception(error);
    }
  }

  Future<DetailModel> details() async {
    try{
      final response = await _dio.get(Api.details, options: Options(
        headers: { 'requirestoken': true },
      ));

      return DetailModel.fromJson(response.data);
    } catch(error) {
      print('error');
      throw Exception(error);
    }
  }

  Future<Null> logout() async {
    try{
      await _dio.post(
        Api.logout, 
        options: Options(
          headers: { 'requirestoken': true }
        )
      );

      _preferences.clear();
    }catch(error){
      throw Exception(error);
    }
  }
}