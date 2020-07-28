import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/navigation.dart';
import 'core/utils/injector.dart';
import 'core/utils/routes.dart';
import 'ui/constants/style.dart';
import 'ui/screens/login/login.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(MyApp());
  }catch(error, stacktrace){
    throw Exception("$error $stacktrace");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Style.primary
    ));

    return MaterialApp(
      title: 'Kuliner Majalengka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: "MontserratAlternatesMedium",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      navigatorKey: locator<Navigation>().navigatorKey,
      onGenerateRoute: generateRoute,
    );
  }
}