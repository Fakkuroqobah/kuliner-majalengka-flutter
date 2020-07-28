import 'package:mobx/mobx.dart';

import '../../services/restaurant_service.dart';
import '../../models/restaurant_model.dart';

part 'restaurant_controller.g.dart';

class RestaurantController = _RestaurantController with _$RestaurantController;

abstract class _RestaurantController with Store {
  final RestaurantService _restaurantService = RestaurantService();

  @observable
  ObservableFuture<List<RestaurantModel>> _restaurantsRandom;
  ObservableFuture<List<RestaurantModel>> get restaurantsRandom => _restaurantsRandom;

  @action
  ObservableFuture<List<RestaurantModel>> random() => _restaurantsRandom = ObservableFuture(_restaurantService
    .random()
    .then((List<RestaurantModel> restaurants) => restaurants));
}