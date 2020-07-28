import 'package:mobx/mobx.dart';

import '../../services/category_service.dart';
import '../../models/category_model.dart';

part 'category_controller.g.dart';

class CategoryController = _CategoryController with _$CategoryController;

abstract class _CategoryController with Store {
  final CategoryService _categoryService = CategoryService();

  @observable
  ObservableFuture<List<CategoryModel>> _categoriesRandom;
  ObservableFuture<List<CategoryModel>> get categoriesRandom => _categoriesRandom;

  @action
  ObservableFuture<List<CategoryModel>> random() {
    return _categoriesRandom = ObservableFuture(_categoryService.random().then((List<CategoryModel> categories) {
      return categories; 
    }));
  }
}