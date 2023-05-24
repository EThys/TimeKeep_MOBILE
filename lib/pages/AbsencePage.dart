import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/controllers/AbsenceController.dart';

import '../widgets/ChampsSaisie.dart';
class AbsenceFormPage extends StatefulWidget {
  const AbsenceFormPage({Key? key}) : super(key: key);

  @override
  State<AbsenceFormPage> createState() => _AbsenceFormPageState();
}

class _AbsenceFormPageState extends State<AbsenceFormPage> {
var motif = TextEditingController();
var dateAbsence = TextEditingController();
var formKey = GlobalKey<FormState>();
var titre ="Signaler son absence";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            _body()
        ],
      ),
    );
  }
  Widget _body(){
    return Form(
        child: Center(

          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(titre, style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  ChampSaisie(ctrl: motif,
                      label: "Motif",
                      required: true,
                      prefixIcon: Icons.emoji_people,
                      isPassword: false),
                  SizedBox(
                    height: 20,
                  ),
                  ChampSaisie(ctrl: dateAbsence,
                      label: "Date",
                      required: true,
                      prefixIcon: Icons.date_range,
                      isPassword: false),
                  SizedBox(
                    height: 20,
                  ),
                  _buttonWidget(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget _buttonWidget() {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: _validerFormulaire,
        child: Text('Signaler'),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            )
        ),
      ),
    );
  }

  void _validerFormulaire() async {
    print(motif.text);
    print(dateAbsence.text);
    FocusScope.of(context).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()==true) {
      return;
    }
    var ctrl = context.read<AbsenceController>();
    Map donneesAbsence = {"motif": motif.text, "date_absence": dateAbsence.text, "user_id": int.parse('1')};
    print(donneesAbsence);
    var statut = await ctrl.signalerAbsence(donneesAbsence);
    print(statut);
    await Future.delayed(Duration(seconds: 5));

  }
}
