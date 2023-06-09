import 'dart:io';

import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/models/AuthentificationModel.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import '../utils/requetes.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/StockageKeys.dart';


class AuthentificationCtrl with ChangeNotifier {

  AuthentificationCtrl({this.stockage});

  String? token;
  AuthentificationModel? user;
  GetStorage? stockage;

  List<AuthentificationModel> auth = [];
  bool loading = false;//gestion de cas d'erreur



  Future<HttpResponse>login(Map data) async{
    var url="${Endpoints.authentificationEndpoint}";
    HttpResponse response = await postData(url, data);
    if(response.status){
      //stockage?.write("user", response.data?["data"] ?? {});
      stockage?.write(StockageKeys.tokenKey, response.data?["data"]["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    return response;


  }

  Future<HttpResponse> logout(Map data) async{
    var url="${Endpoints.logout}";
    var tkn = stockage?.read(StockageKeys.tokenKey);
    HttpResponse response = await postData(url, data, token: tkn);
    if(response.status){
      // if(response!= null/){
      //user=AuthentificationModel.fromJson(response.data?['user'] ?? {});
      //stockage?.write("user", response.data?["data"] ?? {});
      //stockage?.write(StockageKeys.tokenyKey, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    return response;


  }




  }





