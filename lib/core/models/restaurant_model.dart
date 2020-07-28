import 'dart:convert';

List<RestaurantModel> restaurantModelFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  RestaurantModel({
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
    this.user,
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
  User user;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
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
    user: User.fromJson(json["user"]),
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
    "user": user.toJson(),
  };
}

class User {
  User({
    this.idUser,
    this.userName,
    this.userEmail,
    this.userImage,
    this.createdAt,
  });

  int idUser;
  String userName;
  String userEmail;
  String userImage;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["id_user"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userImage: json["user_image"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "user_name": userName,
    "user_email": userEmail,
    "user_image": userImage,
    "created_at": createdAt.toIso8601String(),
  };
}