class Api {
  static const String baseUrl = "http://192.168.100.4/kuliner_majalengka/public";
  static const String resource = "http://192.168.100.4/kuliner_majalengka/public/images";

  // user
  static const String userSource = "$resource/avatar/";
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String refresh = "$baseUrl/refresh";
  static const String details = "$baseUrl/user/details";
  static const String logout = "$baseUrl/logout";

  // restaurant
  static const String restoSource = "$resource/resto/";
  static const String restaurantsRandom = "$baseUrl/restaurant/random";

  // category
  static const String categoriesRandom = "$baseUrl/category/random";

  // menu
  static const String menuSource = "$resource/menus/";
  static const String menus = "$baseUrl/menu";
  static const String menusRandom = "$baseUrl/menu/random";
}