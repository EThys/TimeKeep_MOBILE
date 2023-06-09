import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/models/AuthentificationModel.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import '../utils/Requete.dart';
import 'package:get_storage/get_storage.dart';


class ProfileCtrl with ChangeNotifier {
  ProfileCtrl({this.stockage});
  GetStorage? stockage;
  List<AuthentificationModel> auth = [];
  bool loading = false;//gestion de cas d'erreur


  void recuperProfil() async{
    var url="${Endpoints.profilEndpoint}";
    loading=true;
    notifyListeners();
    var res =await getData(url);
    print('::::::::$res');
    notifyListeners();

  }
}



void main() {
  var ctrl =ProfileCtrl();
  ctrl.recuperProfil();
}