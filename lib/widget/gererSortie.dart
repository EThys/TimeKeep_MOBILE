import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widget/showPresenceMsg.dart';
import '../controllers/DepartController.dart';



Future<void> gererSortie(BuildContext context, String connectionStatus, dynamic resultScan, controller) async {
  var DepartCtrl = context.read<DepartController>();
  var result = await DepartCtrl.setDepartApi(resultScan!, {'bssid': connectionStatus, 'user_id': '3',"id":"3"});

  switch (result.data!['message']) {
    case "Depart enregistre":
      showPresenceMsg(context, true, "Votre sorti a été enregistrée avec succès");
      controller.dispose();
      break;
    case "Depart deja enregistre":
      showPresenceMsg(context, false, "Votre départ est deja enregistrée");
      controller.dispose();
      break;
    case "Reseau non autorise":
      showPresenceMsg(context, false, "Réseau non autorisé");
      controller.dispose();
      break;
    default:
      controller.dispose();
  }
}