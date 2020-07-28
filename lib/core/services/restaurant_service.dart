import 'package:dio/dio.dart';

import '../configs/api.dart';
import '../models/restaurant_model.dart';

class RestaurantService {
  final _dio = Dio();
  
  Future<List<RestaurantModel>> random() async {
    try{
      final response = await _dio.get(Api.restaurantsRandom);
      List<RestaurantModel> _restaurants = [];
      
      response.data['data'].forEach((val){
        _restaurants.add(RestaurantModel.fromJson(val));
      });

      return _restaurants;
    }catch(error){
      throw Exception(error.toString());
    }
  }
}