import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:squelette_mobile_parcours/widget/gererEntrer.dart';

import '../widget/gererSortie.dart';

class QrPresenceScannerPage extends StatefulWidget {
  final String type;

   QrPresenceScannerPage({Key? key, required this.type}) : super(key: key);

  @override
  State<QrPresenceScannerPage> createState() => _QrPresenceScannerPageState();
}

class _QrPresenceScannerPageState extends State<QrPresenceScannerPage> {

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

                 if(widget.type=="Entree"){
                   gererEntrer(context, _connectionStatus, resultScan, controller);
                 }else if(widget.type=="Sortie"){
                   gererSortie(context, _connectionStatus, resultScan, controller);
                 }
                 else{
                   return;
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





