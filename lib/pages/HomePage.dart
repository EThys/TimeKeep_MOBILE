import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
//import 'package:squelette_mobile_parcours/pages/NotificationPage.dart';

import '../utils/Routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top:30,right: 20),
              child: IconButton(icon:Icon(Icons.notifications_active,size: 30,color:Utils.COLOR_ORANGE), onPressed: () {
                /*    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>NotificationPage()),
      );*/
              },),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top:70),
              child: Text("Tableau de bord",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
          /*  Container(
            decoration: BoxDecoration(
                color: Utils.COLOR_ORANGE,
                borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(0),)),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'TIMEKEEP',
                    style: TextStyle(color: Utils.COLOR_BLANCHE,fontWeight: FontWeight.bold,fontSize: 35)
                  ),


                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),*/
          Container(
            // color: Utils.COLOR_ORANGE,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                //color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 30,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 30,
                crossAxisCount: 2,
                children: [
                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(

                      onPressed: (){},
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Congé",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        // elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),
                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(

                      onPressed: (){
                        Navigator.pushNamed(context, Routes.AbsenceRoutes);
                      },
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Absence",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        // elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),

                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(

                      onPressed: (){
                        Navigator.pushNamed(context,Routes.Approbation ,
                        );

                      },
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Approbation",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        //   elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),
                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(

                      onPressed: (){},
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Jours Ferié",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        // elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),
                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(

                      onPressed: (){},
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Mes Taches",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        //  elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),
                  Container(

                    width: 50,
                    height: 112,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Lottie.asset("images/86900-file-icon-animation-optimized.json"),
                          Text("Documents",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        //  elevation: 10,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),

                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}