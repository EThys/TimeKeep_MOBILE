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
                if(resultScan==null)return;

                var presenceCtrl=context.read<PresenceController>();
                var result=await presenceCtrl.setPresenceApi(resultScan!, {'idwifi':_connectionStatus});

                if(mounted && result!=null) {
                  showPresenceMsg(context, true, "Votre Présence à été enregistré avec succés");
                }
                else{
                  showPresenceMsg(context, false, "Vous avez scaner votre présence avec un réseau non autorisé");
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



