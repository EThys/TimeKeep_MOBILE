import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/ApprobationPage.dart';
import 'package:squelette_mobile_parcours/pages/BottomNavBar.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/ModifierPassword.dart';
import '../pages/AuthentificationPage.dart';
import '../pages/QrPresenceScannerPage.dart';
import '../pages/TemplatePage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.QrCodeScannerRoute:
        String _type=(r.arguments as String?) ?? "Entree"; //Sortie
        return MaterialPageRoute(builder: (_) => QrPresenceScannerPage(type: _type,));
      case Routes.Authentification:
        return MaterialPageRoute(builder: (_) => AuthentificationPage());
      case Routes.HistoriqueRoutes:
        return MaterialPageRoute(builder: (_)=>HistoriquePage());
      case Routes.BottomNavBar:
        return MaterialPageRoute(builder: (_)=>BottomNavBar());
      case Routes.ModifierPassword:
        return MaterialPageRoute(builder: (_)=>ModifierPassword());
      case Routes.ApprobationPage:
        return MaterialPageRoute(builder: (_)=>ApprobationPage());
        default:
        return MaterialPageRoute(builder: (_) => TemplatePage());
    }
  }
}
