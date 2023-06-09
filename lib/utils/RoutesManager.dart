import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/StartPage.dart';
import '../pages/QrPresenceScannerPage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.QrCodeScannerRoute:
        String _type=(r.arguments as String?) ?? "Entree"; //Sortie
        return MaterialPageRoute(builder: (_) => QrPresenceScannerPage(type: _type));
        case Routes.AbsenceRoutes:
          return MaterialPageRoute(builder: (_) => AbsencePage());
          case Routes.HistoriqueRoutes:
            return MaterialPageRoute(builder: (_) => HistoriquePage());
            default:
              return MaterialPageRoute(builder: (_) => StartedPage());

    }
  }
}
