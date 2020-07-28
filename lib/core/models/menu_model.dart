import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) => List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
    this.idMenu,
    this.menuName,
    this.menuSlug,
    this.menuPrice,
    this.menuImage,
    this.menuInfo,
    this.menuFavorite,
    this.menuRestaurant,
    this.createdAt,
    this.updatedAt,
    this.restaurant,
  });

  int idMenu;
  String menuName;
  String menuSlug;
  int menuPrice;
  String menuImage;
  String menuInfo;
  int menuFavorite;
  int menuRestaurant;
  DateTime createdAt;
  DateTime updatedAt;
  Restaurant restaurant;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    idMenu: json["id_menu"],
    menuName: json["menu_name"],
    menuSlug: json["menu_slug"],
    menuPrice: json["menu_price"],
    menuImage: json["menu_image"],
    menuInfo: json["menu_info"],
    menuFavorite: json["menu_favorite"],
    menuRestaurant: json["menu_restaurant"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    restaurant: Restaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "id_menu": idMenu,
    "menu_name": menuName,
    "menu_slug": menuSlug,
    "menu_price": menuPrice,
    "menu_image": menuImage,
    "menu_info": menuInfo,
    "menu_favorite": menuFavorite,
    "menu_restaurant": menuRestaurant,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "restaurant": restaurant.toJson(),
  };
}

class Restaurant {
  Restaurant({
    this.idRestaurant,
    this.restaurantName,
    this.restaurantSlug,
    this.restaurantOwner,
    this.restaurantAddress,
    this.restaurantImage,
    this.restaurantLatitude,
    this.restaurantLongitude,
    this.restaurantDescription,
    this.restaurantSeen,
    this.restaurantActive,
    this.restaurantUser,
    this.createdAt,
    this.updatedAt,
  });

  int idRestaurant;
  String restaurantName;
  String restaurantSlug;
  String restaurantOwner;
  String restaurantAddress;
  String restaurantImage;
  String restaurantLatitude;
  String restaurantLongitude;
  String restaurantDescription;
  int restaurantSeen;
  int restaurantActive;
  int restaurantUser;
  DateTime createdAt;
  DateTime updatedAt;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    idRestaurant: json["id_restaurant"],
    restaurantName: json["restaurant_name"],
    restaurantSlug: json["restaurant_slug"],
    restaurantOwner: json["restaurant_owner"],
    restaurantAddress: json["restaurant_address"],
    restaurantImage: json["restaurant_image"],
    restaurantLatitude: json["restaurant_latitude"],
    restaurantLongitude: json["restaurant_longitude"],
    restaurantDescription: json["restaurant_description"],
    restaurantSeen: json["restaurant_seen"],
    restaurantActive: json["restaurant_active"],
    restaurantUser: json["restaurant_user"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_restaurant": idRestaurant,
    "restaurant_name": restaurantName,
    "restaurant_slug": restaurantSlug,
    "restaurant_owner": restaurantOwner,
    "restaurant_address": restaurantAddress,
    "restaurant_image": restaurantImage,
    "restaurant_latitude": restaurantLatitude,
    "restaurant_longitude": restaurantLongitude,
    "restaurant_description": restaurantDescription,
    "restaurant_seen": restaurantSeen,
    "restaurant_active": restaurantActive,
    "restaurant_user": restaurantUser,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}