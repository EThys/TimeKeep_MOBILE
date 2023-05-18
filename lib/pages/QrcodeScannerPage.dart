import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import 'package:squelette_mobile_parcours/utils/showPresenceMsg.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {

  bool flashOn=false;
  bool frontCam= false;
  GlobalKey qrKey=GlobalKey();
  QRViewController ? qrController;
  String ? resultScan;
  String ? wifiId;
  String _connectionStatus = '';
  final NetworkInfo infoReseau = NetworkInfo();

  @override
  void initState() {
    super.initState();
    _infoConnection();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(),);
  }
  Widget _body(){
    return Stack(
      children: [
        QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.white
            ),
            onQRViewCreated: (QRViewController controller){
              this.qrController=controller;
              controller.scannedDataStream.listen((scanData) async {
                resultScan=scanData.code;
                controller.dispose();

                var presenceCtrl=context.read<PresenceController>();
                var result=await presenceCtrl.setPresenceApi(resultScan!, {'bssid':_connectionStatus,'user_id':'4'});

                switch (result.data!['message']) {
                  case "Présence enregistré":
                    showPresenceMsg(context, true, "Votre présence a été enregistré avec succés");
                    controller.dispose();
                    break;
                  case "Présence deja enregistré":
                    showPresenceMsg(context, false, "Votre Présence est deja enregistré");
                    controller.dispose();
                    break;
                  case "Réseau non autorisé":
                    showPresenceMsg(context, false, "Réseau non autorisé");
                    controller.dispose();
                    break;
                  default:
                    controller.dispose();
                }
              });
            }
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 45),
            child: Text('Présence',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Colors.white
            ),),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  color:Colors.white,
                  icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
                  onPressed: (){
                    setState(() {
                      flashOn=true;
                    });
                    qrController!.toggleFlash();
                  }

              ),
              IconButton(
                  color:Colors.white,
                  icon: Icon(frontCam ? Icons.camera_front : Icons.camera_rear),
                  onPressed: (){
                    setState(() {
                      frontCam=true;
                    });
                    qrController!.flipCamera();
                  }
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: (){Navigator.pop(context);},
              )
            ],
          ),
        )
      ],
    );
  }
  Future<void> _infoConnection() async {
    wifiId = await infoReseau.getWifiBSSID();
    _connectionStatus =  '$wifiId';
  }
}



