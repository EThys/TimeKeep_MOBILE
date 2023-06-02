import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squelette_mobile_parcours/utils/StockageKeys.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class PresenceController with ChangeNotifier{

  GetStorage? stockage;
  int? _presence_id;

  PresenceController({this.stockage});

  Future<HttpResponse> setPresenceApi(String api_url,Map data) async{
    var _token=stockage?.read(StockageKeys.tokenKey);
    var reponse=await postData(api_url,data, token: _token);

    if(reponse.status){
      _presence_id= reponse.data!['id'];
      stockage?.write(StockageKeys.presenceKey,_presence_id);
      notifyListeners();
    }

    return reponse;
  }

  Future<HttpResponse> setDepartApi(String api_url,String bssid) async{
    int presence_id=_presence_id?? stockage?.read(StockageKeys.presenceKey);
    Map data={"id": presence_id, "bssid": bssid };
    var _token=stockage?.read(StockageKeys.tokenKey);
    var reponse=await patchData(api_url,data,token: _token);

    if(reponse.status){
      stockage?.remove(StockageKeys.presenceKey);
      notifyListeners();
    }

    return reponse;
  }


}


