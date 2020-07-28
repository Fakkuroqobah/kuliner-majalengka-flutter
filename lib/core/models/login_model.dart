import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  User user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
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
