import 'package:flutter/material.dart';

import '../pages/QrcodeScannerPage.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.TemplateRoutes:
        //var args=r.arguments as String?;
        return MaterialPageRoute(builder: (_) => QrCodeScannerPage());

      default:
        return MaterialPageRoute(builder: (_) => QrCodeScannerPage());
    }
  }
}
