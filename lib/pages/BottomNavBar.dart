import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/controllers/PresenceController.dart';
import 'package:squelette_mobile_parcours/pages/ProfilePage.dart';
import 'package:squelette_mobile_parcours/pages/HomePage.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import '../utils/Routes.dart';
import 'QrPresenceScannerPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    ProfilePage(),
    HomePage(),
    HistoriquePage(),
    HomePage(),
  ];

  Widget currentScreen = HomePage();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(
          Icons.qr_code_scanner,
          color: Utils.COLOR_BLANCHE,
        ),
        backgroundColor: Utils.COLOR_GREEN,
        onPressed: () {
          _ouvrirModalBottomsheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.black,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 30, color: currentTab ==0? Utils.COLOR_ORANGE:Utils.COLOR_GREY),
                        Text('Accueil', style: TextStyle(color: currentTab ==0? Utils.COLOR_ORANGE:Utils.COLOR_BLANCHE))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // currentScreen=ProfilPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule,
                            size: 30,  color: currentTab ==1? Utils.COLOR_ORANGE:Utils.COLOR_GREY),
                        Text(
                          'Horaire',
                          style: TextStyle(color: currentTab ==1? Utils.COLOR_ORANGE:Utils.COLOR_BLANCHE),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HistoriquePage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history,
                            size: 30,  color: currentTab ==2? Utils.COLOR_ORANGE:Utils.COLOR_GREY),
                        Text('Historique',
                            style: TextStyle(color: currentTab ==2? Utils.COLOR_ORANGE:Utils.COLOR_BLANCHE))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 30,  color: currentTab ==3? Utils.COLOR_ORANGE:Utils.COLOR_GREY),
                        Text('Profil',
                            style: TextStyle(color: currentTab ==3? Utils.COLOR_ORANGE:Utils.COLOR_BLANCHE))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _ouvrirModalBottomsheet() {
    return showModalBottomSheet(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed
      barrierColor: Colors.black12.withOpacity(.70),
      //background color for modal bottom screen
      backgroundColor: Utils.COLOR_BLANCHE,
      //elevates modal bottom screen
      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return SizedBox(
          height: 350,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Utils.COLOR_GREY
                    ),
                  ),
                ),
                Center(
                  child: Text("Scanner",style: TextStyle(color: Utils.COLOR_ORANGE,fontWeight: FontWeight.bold,fontSize: 25,fontStyle: FontStyle.italic),),
                ),
                SizedBox(height: 30,),
         /*       Container(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundColor: Utils.COLOR_BLANCHE,
                      child: IconButton(
                          iconSize: 13,
                          padding: EdgeInsets.zero,
                          color: Utils.COLOR_ORANGE,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close)),
                    ),
                  ),
                ),*/
                Container(
                  child: Text("Pointer votre présence en scannant le code Qr.",style: TextStyle(fontStyle: FontStyle.italic),),
                ),
                SizedBox(height: 30,),
                Container(
                    width: 280,
                  height: 55,
                  color: Utils.COLOR_BLANCHE,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                            backgroundColor: Utils.COLOR_ORANGE,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          print("++++++++++++++++++++++++++++++++++++++++++++");
                          Navigator.pushNamed(
                            context,
                            Routes.QrCodeScannerRoute,
                            arguments: 'Entree',
                          );
                        },
                        child: Text("Entrée",style: TextStyle(color:Utils.COLOR_BLANCHE,fontWeight: FontWeight.bold,fontSize: 16,fontStyle: FontStyle.italic),))),
                SizedBox(height: 20,),
                Container(
                  width: 280,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                            backgroundColor: Utils.COLOR_NOIR,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.QrCodeScannerRoute,
                            arguments: 'Sortie',
                          );
                        },
                        child: Text("Sortie",style: TextStyle(color:Utils.COLOR_BLANCHE,fontWeight: FontWeight.bold,fontSize: 16,fontStyle: FontStyle.italic),))),
              ],
            ),
          ),
        );
      },
    );
  }
}
