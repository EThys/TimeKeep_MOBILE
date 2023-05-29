import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class PresenceController with ChangeNotifier{
  String ? wifiId;

  Future<HttpResponse> setPresenceApi(String api_url,Map data) async{
    var reponse=await postData(api_url,data);
    print('----------------------reponse ${reponse.data}');

    return reponse;
  }
}


 void main() {
   var test = PresenceController();
   test.setPresenceApi("/api/scanArrive", {"bssid":"02:00:00:00:00:00","user_id":"4"});
 }
