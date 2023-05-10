import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squelette_mobile_parcours/utils/Constantes.dart';


Future<dynamic> getData(String url_api) async{
  try {
    var url = Uri.parse('${Constantes.BASE_URL}$url_api');
    var reponse = await http.get(url).timeout(Duration(seconds: 5));
    print(reponse.runtimeType);
    print(reponse.body.runtimeType);
    print(reponse.body); // contient le resultat de la reponse
    print(reponse.statusCode); // contient le code http
    if(reponse.statusCode==200){
      return jsonDecode(reponse.body);
    }
    return null;
  }catch(e, trace){
    print(e.toString());
    print(trace.toString());
    return null;
  }

}

Future<dynamic> postData(String api_url,Map data) async{
  try {
    var url = Uri.parse('${Constantes.BASE_URL}$api_url');
    String dataStr = jsonEncode(data); //converti le data en chaine de caractere
    var reponse = await http.post(url, body: dataStr).timeout(Duration(seconds: 5));
    var successList = [200, 201];
    //print(reponse.body);
    if (successList.contains(reponse.statusCode)) {
      return json.decode(reponse.body);
    }
    return null;
  }catch(e, trace){
    print(e.toString());
    print(trace.toString());
    return null;
  }
}


