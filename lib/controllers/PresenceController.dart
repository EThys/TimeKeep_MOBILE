import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class PresenceController with ChangeNotifier{
  String ? wifiId;

  Future<HttpResponse> setPresenceApi(String api_url,Map data) async{
    var reponse=await postData(api_url,data);
    return reponse;
  }
}