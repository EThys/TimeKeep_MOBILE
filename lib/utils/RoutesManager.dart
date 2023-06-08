import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/SplashScreen.dart';
import '../pages/AuthentificationPage.dart';
import 'package:squelette_mobile_parcours/utils/Routes.dart';




class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:
      //var args=r.arguments as String?;
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.Splashscreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.Authentification:
        return MaterialPageRoute(builder: (_) => AuthentificationPage());
        default:
            return MaterialPageRoute(builder: (_) => SplashScreen());

    }
  }
}
