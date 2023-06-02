import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Constantes.dart';

Future<dynamic> getData(String api_url, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");
    var _token = token ?? Constantes.DEFAULT_TOKEN;
    var reponse = await http.get(url, headers: {"Content-Type":"application/json", "Authorization":"Bearer $_token"}).timeout(Duration(seconds: 5));
    if (reponse.statusCode == 200) {
      return json.decode(reponse.body);
    }
    return null;
  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    return null;
  }
}

class HttpResponse {
  bool status;
  Map? data;
  String? errorMsg;
  bool? isException;

  HttpResponse(
      {this.data, required this.status, this.errorMsg, this.isException});
}

Future<HttpResponse> postData(String api_url, Map data, {String? token}) async {
  try {
    var url = Uri.parse("${Constantes.BASE_URL}$api_url");
    String dataStr = json.encode(data);
    var _token = token ?? Constantes.DEFAULT_TOKEN;
    var response = await http.post(url, body: dataStr, headers: {
      "Content-Type": "application/json", "Authorization":"Bearer $_token"
    }).timeout(Duration(seconds: 5));
    var successList = [200, 201];
    var msg = json.decode(response.body);
    var st = successList.contains(response.statusCode);
    if(response.statusCode == 500) throw Exception(msg);
    return HttpResponse(status: st, data: msg);

  } catch (e, trace) {
    print(e.toString());
    print(trace.toString());
    return HttpResponse(
        status: false,
        errorMsg: "Erreur inattendue",
        isException: true);
  }
}


