import 'package:dio/dio.dart';

import '../configs/api.dart';
import '../models/category_model.dart';

class CategoryService {
  Dio _dio = Dio();

  Future<List<CategoryModel>> random() async {
    try {
      final response = await _dio.get(Api.categoriesRandom);
      List<CategoryModel> categories = [];

      response.data['data'].forEach((val) {
        categories.add(CategoryModel.fromJson(val));
      });

      return categories;
    } catch(error) {
      throw Exception(error);
    }
  }
}