import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:squelette_mobile_parcours/models/AbsenceModel.dart';
import 'package:squelette_mobile_parcours/utils/Endpoints.dart';
import '../utils/Constantes.dart';
import '../utils/requetes.dart';

class AbsenceController with ChangeNotifier {
  List <AbsenceModel> listeAbsences = [];
  AbsenceModel? absence;
  bool loading = false;
  GetStorage? stockage;

  AbsenceController({this.stockage});

  void recuperAbsences() async {
    var url = "${Endpoints.recupererAbsence}";
    loading = true;
    notifyListeners();
    var reponse = await getData(url);
    if (reponse != null) {
      listeAbsences = reponse.map<AbsenceModel>((e) => AbsenceModel.fromJson(e)).toList();
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
  Future<HttpResponse> signalerAbsence(Map donneesAbsences, {bool cancel = false}) async {
    var url="";
    if(cancel){
      url = "${Endpoints.annulerAbsence}";
    }else{
      url = "${Endpoints.absence}";
    }
    HttpResponse reponse = await postData(url, donneesAbsences);
    if (reponse.status) absence = AbsenceModel.fromJson(reponse.data ?? {});
    notifyListeners();
    return reponse;
  }
}

void main() {
  var f = AbsenceController();
  f.recuperAbsences();

}
