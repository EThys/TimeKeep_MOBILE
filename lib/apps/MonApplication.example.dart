import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';
import 'package:provider/provider.dart';

class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider (
        providers: [
          ChangeNotifierProvider(create: (_)=>PresenceController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.route,
          initialRoute: Routes.QrCodeScannerRoute,
        )
    );
  }
}
