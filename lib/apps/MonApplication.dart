import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import 'package:squelette_mobile_parcours/controllers/ProfilCtrl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import 'package:squelette_mobile_parcours/controllers/AbsenceController.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';
import 'package:provider/provider.dart';
import '../utils/StockageKeys.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:flutter/services.dart';
import '../utils/StockageKeys.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:flutter/services.dart';

class MonApplication extends StatelessWidget {
  final box=GetStorage(); //partager les donnees de stockage
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
        ChangeNotifierProvider(create: (_)=> ProfilCtrl(stockage:box)),//box pour partager les donnees dans mon application
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.ProfilPage,
      ),
    );
  }
}

