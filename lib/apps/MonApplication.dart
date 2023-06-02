import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';
import 'package:provider/provider.dart';

class MonApplication extends StatelessWidget {
  var _stockage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => PresenceController(stockage: _stockage)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.route,
          initialRoute: Routes.QrCodeScannerRoute,
        ));
  }
}

