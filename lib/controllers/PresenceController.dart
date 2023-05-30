import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class PresenceController with ChangeNotifier{

  GetStorage ? stockage;

  Future<HttpResponse> setPresenceApi(String api_url,Map data) async{
    var reponse=await postData(api_url,data);
    print('----------------------reponse ${reponse.data}');

    return reponse;
  }
}
