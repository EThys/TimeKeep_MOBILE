import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/requetes.dart';

class DepartController with ChangeNotifier{

  Future<HttpResponse> setDepartApi(String api_url,Map data) async{
    var reponse=await patchData(api_url,data);
    print('----------------------reponse ${reponse.data}');

    return reponse;
  }
}


