import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/HomePage.dart';
import 'package:squelette_mobile_parcours/pages/ReinitialiserPassword.dart';
import 'package:squelette_mobile_parcours/pages/SplashScreen.dart';
import 'package:squelette_mobile_parcours/pages/BottomNavBar.dart';

import '../pages/AuthentificationPage.dart';
import '../pages/ProfilPage.dart';import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/HomePage.dart';
//import 'package:squelette_mobile_parcours/pages/ReinitialiserPassword.dart';
import 'package:squelette_mobile_parcours/pages/SplashScreen.dart';
import 'package:squelette_mobile_parcours/pages/BottomNavBar.dart';
//import '../pages/ApprobationPage.dart';
import '../pages/AbsencePage.dart';
import '../pages/AuthentificationPage.dart';
//import '../pages/ProfilPage.dart';import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/StartPage.dart';
import '../pages/QrPresenceScannerPage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:
      //var args=r.arguments as String?;
        return MaterialPageRoute(builder: (_) => TemplatePage());
      case Routes.Splashscreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.Authentification:
        return MaterialPageRoute(builder: (_) => AuthentificationPage());
      case Routes.Home:
        return MaterialPageRoute(builder: (_)=> HomePage());
      case Routes.PasswordReset:
        return MaterialPageRoute(builder: (_)=> ProfilPage());
      case Routes.BottomNavBar:
        return MaterialPageRoute(builder: (_)=>BottomNavBar());
      case Routes.Historique:
        return MaterialPageRoute(builder: (_)=>HistoriquePage());

          default:
        String _type=(r.arguments as String?) ?? "Entree";
        return MaterialPageRoute(builder: (_) => QrPresenceScannerPage(type: _type));

    }
  }
}
