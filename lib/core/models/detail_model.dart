import 'dart:convert';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
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