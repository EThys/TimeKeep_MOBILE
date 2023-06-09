import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import 'package:squelette_mobile_parcours/controllers/ProfileCtrl.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';
import 'package:provider/provider.dart';
import '../utils/StockageKeys.dart';





class MonApplication extends StatelessWidget {
  final box=GetStorage();
  var _stockage = GetStorage();

  @override
  Widget build(BuildContext context) {
    var token=box.read(StockageKeys.tokenKey);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PresenceController(stockage: _stockage)),
          ChangeNotifierProvider(create: (_) => AuthentificationCtrl(stockage: box)),
          ChangeNotifierProvider(create: (_) => ProfileCtrl(stockage: box))
        ],
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.route,
          initialRoute: token!=null ? Routes. BottomNavBar : Routes.Authentification,
        ));
  }
}

