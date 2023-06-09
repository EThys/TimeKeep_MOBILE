import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widget/showPresenceMsg.dart';

import '../controllers/PresenceController.dart';


Future<void> gererEntrer(BuildContext context, String connectionStatus, dynamic resultScan, controller) async {
  var presenceCtrl = context.read<PresenceController>();
  var result = await presenceCtrl.setPresenceApi(resultScan!, {'bssid': connectionStatus, 'user_id': '3'});

  switch (result.data!['message']) {
    case "Presence enregistre":
      showPresenceMsg(context, true, "Votre présence a été enregistrée avec succès");
      controller.dispose();
      break;
    case "Presence deja enregistre":
      showPresenceMsg(context, false, "Votre Présence est deja enregistrée");
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