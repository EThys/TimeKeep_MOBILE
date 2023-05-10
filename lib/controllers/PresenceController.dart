import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class PresenceController with ChangeNotifier{
  String ? wifiId;

  setPresenceApi(String api_url,Map data) async{
    var reponse=await postData(api_url,data);
    print(reponse);

  }
}

 void main(){
  var test=PresenceController();
  test.setPresenceApi('/muzolaethberg/api_presence/presence.php',{'idwifi':'10:20:20:00'});
}