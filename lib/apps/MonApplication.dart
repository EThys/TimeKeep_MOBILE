import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';
import 'package:provider/provider.dart';
import '../utils/StockageKeys.dart';


class MonApplication extends StatelessWidget {
  final box=GetStorage(); //partager les donnees de stockage
  var _stockage = GetStorage();

  @override
  Widget build(BuildContext context) {
    var user=box.read<Map>(StockageKeys.userKey);
    var usertoken=box.read<Map>(StockageKeys.tokenKey);
    var token=box.read(StockageKeys.tokenKey);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthentificationCtrl(stockage:box)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.ProfilPage,
      ),
    );
  }
}

