import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';
import 'package:squelette_mobile_parcours/widget/Chargement.dart';

class ModifierPassword extends StatefulWidget {
  const ModifierPassword({Key? key}) : super(key: key);

  @override
  State<ModifierPassword> createState() => _ModifierPasswordState();
}

class _ModifierPasswordState extends State<ModifierPassword> {
  bool isVisible=false;
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Stack(
          children: [_body(context), Chargement(isVisible)],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
        key: formKey,
        child: Center(

            child:  Container(
                margin: EdgeInsets.only(top: 50,bottom: 20),
                child: Column(
                    children: [
                      _titre_widget(),
                      _text_widget(),
                      _Email_widget(),
                      SizedBox(height: 40,),
                      _button_widget()

                    ]  ))));
  }

  Widget _titre_widget(){
    return  Container(
        margin: EdgeInsets.only(top: 100, bottom: 20),
        child: Text(
            "Mot de passe oublié?",
            style: TextStyle(color: Utils.COLOR_ORANGE,
              fontWeight: FontWeight.bold,
              fontFamily: "Schyler",fontSize: 29,)
        ));

  }

  Widget _text_widget() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Text(
            "Entrez votre email ci-dessous",
            style: TextStyle(fontSize: 17,fontFamily: 'Schyler'),
          ),
          Text("pour recevoir vos instructions de ",
              style: TextStyle(fontSize: 17,fontFamily: 'Schyler')),
          Text("réinitialisation du mot de passe.",
              style: TextStyle(fontSize: 17,fontFamily: 'Schyler')),
        ],
      ),
    );

  }

  Widget _Email_widget(){

    return Container(
      margin: EdgeInsets.all(30),
      child: TextFormField(
        validator: (String? value) {
          if ( value == null || value.isEmpty) {
            return "votre adresse email*";
          }
          if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
            return 'Entrez une addresse valide*';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Utils.COLOR_ORANGE,
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Utils.COLOR_NOIR,fontSize: 12),
          hintText: 'Email',   hintStyle: TextStyle(fontFamily: 'Schyler',fontSize: 12,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Utils.COLOR_ORANGE_CLAIR,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Utils.COLOR_ORANGE_CLAIR,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Utils.COLOR_ROUGE,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Utils.COLOR_ORANGE_CLAIR,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          contentPadding: EdgeInsetsDirectional.fromSTEB(14, 21, 0, 21),
        ),
      ),
    );
  }

  Widget _button_widget(){
    return   Container(
      width: 250,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          if (!formKey.currentState!.validate()) {
            return;
          }
          isVisible = true;
        },
        child: Text(
          "Réinitialiser le mot de passe",
          style: TextStyle(
              color: Utils.COLOR_ORANGE,
              fontWeight: FontWeight.bold,
              fontFamily: 'Schyler',
              fontSize: 19),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Utils.COLOR_NOIR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }





}

