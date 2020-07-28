import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/navigation.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  
  locator.registerSingleton<SharedPreferences>(preferences);
  locator.registerSingleton<Navigation>(Navigation());
}