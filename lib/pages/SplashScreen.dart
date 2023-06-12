import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:squelette_mobile_parcours/pages/AuthentificationPage.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>AuthentificationPage()),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.COLOR_ORANGE,
      body:SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top:250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 170,width: 270,child: Lottie.asset("images/splashs1.json"),),
              Text("TimeKeep",style: TextStyle(color:Utils.COLOR_BLANCHE,fontWeight: FontWeight.bold,fontSize: 45,fontFamily: "Schyler"),),
              Expanded(

                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          SizedBox(
                            child:Icon(Icons.earbuds,color: Utils.COLOR_BLANCHE,)),
                          Expanded(
                          child:Text('Orange',style: TextStyle(color:Utils.COLOR_BLANCHE,fontSize: 16)),
                          ) ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),



      ),

    );
  }
}
