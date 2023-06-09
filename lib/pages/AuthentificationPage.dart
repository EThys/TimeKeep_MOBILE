import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widget/ChampSaisie.dart';
import 'package:squelette_mobile_parcours/widget/Chargement.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:squelette_mobile_parcours/controllers/AuthentificationCtrl.dart';
import '../utils/MessageSnack.dart';
import '../utils/Routes.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  @override



  bool isRememberMe=false;
  bool isVisible=false;
  String errorMsg="";
  bool isPassword=false;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailLogin=TextEditingController();
  TextEditingController passwordLogin=TextEditingController();


  LoginPressed() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    }
    isVisible = true;
    setState(() {});
    var ctrl = context.read<AuthentificationCtrl>();
    Map datas= {
      "email": emailLogin.text,
      "password":passwordLogin.text
    };
    print(datas);
    var res=await ctrl.login(datas);
    await Future.delayed(Duration(seconds: 4));
    isVisible = false;
    setState(() {});

    if (res.status) {

      Message.afficherSnack(context, "Authentification reussie", Colors.green);
      await Future.delayed(Duration(seconds: 4));
      setState(() {});
      Navigator.pushReplacementNamed(context, Routes.BottomNavBar);

    } else {
      var msg =
      res.isException == true ? res.errorMsg : (res.data?['message']);

      Message.afficherSnack(context, msg);

    }return;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(

        children: [
          _titre_widget(),
          _formulaire_widget(),
          _button_widget(),
          _image_widget(),
          _copyWidget()
        ],
      ),
    );
  }
  Widget _titre_widget() {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image1.jpg"),
                fit: BoxFit.fill,
              )
          ),
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 20),
            color: Utils.COLOR_NOIR.withOpacity(.65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(
                    text: "Welcome to",
                    style: TextStyle(color: Utils.COLOR_BLANCHE,
                        fontWeight: FontWeight.bold,
                        fontSize: 49,
                        fontFamily: "Schyler"),
                    children: [
                      TextSpan(
                          text: "TimeKeep",
                          style: TextStyle(color: Utils.COLOR_ORANGE,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Schyler")
                      )
                    ]
                ),

                )
              ],
            ),
          ),
        ));
  }
  Widget _formulaire_widget() {
    return  Positioned(
        top: 200,
        child:Container(
          padding: EdgeInsets.all(20),
          height: 380,
          width: MediaQuery.of(context).size.width-40,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color:Utils.COLOR_BLANCHE,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Utils.COLOR_NOIR.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5)
              ]
          ),
          child: Column(
            children: [
              Text("Authentification",style: TextStyle(color:Utils.COLOR_NOIR,fontWeight: FontWeight.bold,fontSize: 28,fontFamily: "Schyler"),),
              Container(
                margin: EdgeInsets.all(20),
                child: ChampSaisie(
                  validator: (String? value) {
                    if ( value == null || value.isEmpty) {
                      return "votre adresse email*";
                    }
                      if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                        return 'Entrez une addresse valide*';
                    }
                    return null;
                  },
                  label: "Email",
                  hintext: "Email",
                  ctrl: emailLogin,
                    prefixIcon: Icons.email,
                    type:TextInputType.emailAddress,
                    required:true,
                  isPassword: false,
                ),
              ),


              Container(
                margin: EdgeInsets.all(20),
                child: ChampSaisie(

                    validator: (String? value) {

                      if ( value == null || value.isEmpty) {
                        return "votre mot de passe*";

                      }
                      return null;
                    },
                    ctrl: passwordLogin,
                    label: "Mot de passe",
                    hintext: 'Mot de passe',
                    prefixIcon: Icons.lock,
                    type:TextInputType.text,
                    isPassword: true,
                    required:true),


              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: Utils.COLOR_NOIR,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  Text(
                    "Rester connecté", style: TextStyle(color: Utils.COLOR_GREY),),
                  GestureDetector(
                    child: Text(
                      "Mot de passe oublié?",
                      style: TextStyle(color: Utils.COLOR_NOIR, fontSize: 12,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),

                    ),
                    onTap: () {
                      Navigator.pushNamed(context,Routes.PasswordReset ,
                      );
                    },
                  ),
                ],
              ),


            ],
          ),
        )
    );
  }
  Widget _button_widget() {
    return Positioned(
      top: 535,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          width: 186,
          height: 81,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Utils.COLOR_NOIR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: ()=>LoginPressed(),
            child: Text(
              "Se connecter",
              style: TextStyle(
                  color: Utils.COLOR_ORANGE,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }
  Widget _image_widget() {
    return Positioned(
        top: 650,
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 150),
            child: Image.asset("images/image2.png", width: 50, height: 90,),


          ),

        ));



  }
  Widget _copyWidget(){
    return    Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              children: [
                SizedBox(
                    child:Icon(Icons.earbuds,color: Utils.COLOR_BLANCHE,)),
                Expanded(
                  child:Text('Copyright \u00a9 2023',style: TextStyle(color:Utils.COLOR_NOIR  ,fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                ) ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

}











