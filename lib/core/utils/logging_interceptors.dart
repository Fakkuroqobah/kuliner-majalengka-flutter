import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';
import '../services/user_service.dart';

class LoggingInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final SharedPreferences _preferences = locator<SharedPreferences>();

  LoggingInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      String accessToken = _preferences.getString("userToken");
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    return options;
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }
  
  @override
  Future onError(DioError dioError) async {
    int responseCode = dioError.response.statusCode;
    String oldAccessToken = _preferences.getString("userToken");

    if (oldAccessToken != null && responseCode == 401 && _preferences != null) {
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();

      UserService userService = UserService();
      String token = await userService.refresh();
      await _preferences.setString("userToken", token);
      
      RequestOptions options = dioError.response.request;
      options.headers.addAll({'requirestoken': true});
      
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();

      return _dio.request(options.path, options: options);
    } else {
      super.onError(dioError);
    }
  }
}