import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import '../utils/Constantes.dart';


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
              controller.scannedDataStream.listen((scanData) {

                if(mounted) {

                  if(_connectionStatus==Constantes.wifiIdConst){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(16),
                                  height: 90,
                                  decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_circle_outline,size: 40,color: Colors.white),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Votre Présence à été enregistré avec succés",
                                            style:
                                            TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        )
                    );
                  }
                  else{

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(16),
                                  height: 90,
                                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Icon(Icons.error_outline_outlined,size: 40,color: Colors.white),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("Vous avez scaner votre présence avec un réseau non autorisé",
                                            style:
                                            TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        )
                    );

                  }

                  controller.dispose();
                  setState(() {});
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
    print('----------------------------------------wifi${wifiId}');
    setState(() {
      _connectionStatus =  '$wifiId';
    });
  }
}



