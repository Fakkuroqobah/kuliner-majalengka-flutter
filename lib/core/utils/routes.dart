import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../ui/screens/login/login.dart';
import '../../ui/screens/register/register.dart';
import '../../ui/screens/home/home.dart';
import '../../ui/screens/menu/menu.dart';
import '../../ui/screens/profile/profile.dart';
import '../../ui/screens/notif/notif.dart';

Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
  final Object arguments = settings.arguments;
  const PageTransitionType type = PageTransitionType.rightToLeftWithFade;
  const Duration duration = Duration(milliseconds: 300);

  switch(settings.name) {
    case 'login':
      return PageTransition(type: type, child: Login(), duration: duration);
      break;
    case 'register':
      return PageTransition(type: type, child: Register(), duration: duration);
      break;
    case 'profile':
      return PageTransition(type: type, child: Profile(), duration: duration);
      break;
    case 'home':
      return PageTransition(type: type, child: Home(), duration: duration);
      break;
    case 'menu':
      return PageTransition(type: type, child: Menu(), duration: duration);
      break;
    case 'notif':
      return PageTransition(type: type, child: Notif(), duration: duration);
      break;
    default:
      return PageTransition(type: type, child: Login(), duration: duration);
      break;
  }
}