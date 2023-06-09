import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import '../controllers/PresenceController.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';
import '../utils/StockageKeys.dart';


class MonApplication extends StatelessWidget {
  var _stockage = GetStorage();
  @override
  Widget build(BuildContext context) {
    var token=_stockage.read<Map>(StockageKeys.tokenKey);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthentificationCtrl(stockage:_stockage)),
        ChangeNotifierProvider(create: (_) => PresenceController(stockage: _stockage)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: token!=null ? Routes. BottomNavBar : Routes.Authentification,
      ),
    );
  }
}
