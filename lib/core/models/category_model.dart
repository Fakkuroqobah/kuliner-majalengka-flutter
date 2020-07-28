import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.idCategory,
    this.categoryName,
    this.categoryImage,
    this.categoryUser,
    this.createdAt,
    this.updatedAt,
  });

  int idCategory;
  String categoryName;
  String categoryImage;
  int categoryUser;
  String createdAt;
  String updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    idCategory: json["id_category"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryUser: json["category_user"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id_category": idCategory,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_user": categoryUser,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}