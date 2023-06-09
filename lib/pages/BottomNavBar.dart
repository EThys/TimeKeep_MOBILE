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

  int currentTab=0;
  final List<Widget> screens=[
    ProfilePage(),
    HomePage(),
    HistoriquePage(),
    HomePage(),
  ];

  Widget currentScreen=HomePage();

  final PageStorageBucket bucket=PageStorageBucket();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,

      ),


      floatingActionButton: FloatingActionButton(

        child:Icon(Icons.document_scanner_rounded,color: Utils.COLOR_BLANCHE,),
        backgroundColor: Utils.COLOR_GREEN,
        onPressed: (){
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
                    onPressed: (){
                      setState(() {
                        currentScreen=HomePage();
                        currentTab=0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,size: 30,color:Utils.COLOR_ORANGE),
                        Text('Accueil',style: TextStyle(color:Colors.white))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        // currentScreen=ProfilPage();
                        currentTab=1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule,size: 30,color:Utils.COLOR_ORANGE),
                        Text('Horaire',style: TextStyle(color:Colors.white),)
                      ],
                    ),
                  )
                ],
              ),


              Row(

                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=HistoriquePage();
                        currentTab=3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history,size: 30,color:Utils.COLOR_ORANGE),
                        Text('Historique',style:TextStyle(color:Utils.COLOR_BLANCHE))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        //currentScreen=ProfilPage();
                        currentTab=3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,size: 30,color:Utils.COLOR_ORANGE),
                        Text('Profil',style: TextStyle(color:Utils.COLOR_BLANCHE))
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
    return  showModalBottomSheet(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed
      barrierColor: Colors.grey.withOpacity(.1),
      //background color for modal bottom screen
      backgroundColor: Colors.white,
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
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  trailing: CircleAvatar(
                    backgroundColor: Utils.COLOR_ROUGE,
                    child: IconButton(
                        iconSize: 13,
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.input,color: Utils.COLOR_ORANGE),
                  title: Text('Entrée'),
                  onTap: (){
                    print("++++++++++++++++++++++++++++++++++++++++++++");
                    Navigator.pushNamed(context, Routes.QrCodeScannerRoute, arguments: 'Entree',);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.output,color: Utils.COLOR_ORANGE,),
                  title: Text('Sortie'),
                  onTap: (){
                    Navigator.pushNamed(context, Routes.QrCodeScannerRoute, arguments: 'Sortie',);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
