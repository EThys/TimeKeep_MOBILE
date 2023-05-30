import 'package:flutter/material.dart';

import '../pages/QrPresenceScannerPage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:
        String _type=(r.arguments as String?) ?? "Entree"; //Sortie
        return MaterialPageRoute(builder: (_) => QrPresenceScannerPage(type: _type,));

      default:
        String _type=(r.arguments as String?) ?? "Entree";
        return MaterialPageRoute(builder: (_) => QrPresenceScannerPage(type: _type));
    }
  }
}
