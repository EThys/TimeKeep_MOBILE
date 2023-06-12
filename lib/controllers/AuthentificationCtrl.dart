import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/models/AuthentificationModel.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import '../utils/requetes.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/StockageKeys.dart';

class AuthentificationCtrl with ChangeNotifier {
  AuthentificationCtrl({this.stockage});

  String? token;
  AuthentificationModel _user = AuthentificationModel();
  GetStorage? stockage;

  List<AuthentificationModel> auth = [];
  bool loading = false;

  AuthentificationModel get user {
    var locale = stockage?.read(StockageKeys.userKey);
    _user=AuthentificationModel.fromJson(locale);
    return _user;
  }

  set user(AuthentificationModel value) {
    stockage?.write(StockageKeys.userKey, value.toJson());
    _user = value;
  } //gestion de cas d'erreur

  Future<HttpResponse> login(Map data) async {
    var url = "${Endpoints.authentificationEndpoint}";
    HttpResponse response = await postData(url, data);
    if (response.status) {
      var temp_user = response.data?["data"]["user"] ?? {};
      user = AuthentificationModel.fromJson(temp_user);
      stockage?.write(
          StockageKeys.tokenKey, response.data?["data"]["token"] ?? "");
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  Future<HttpResponse> logout(Map data) async {
    var url = "${Endpoints.logout}";
    var tkn = stockage?.read(StockageKeys.tokenKey);
    HttpResponse response = await postData(url, data, token: tkn);
    if (response.status) {
      notifyListeners();
    }
    print(response.data);
    return response;
  }
}
