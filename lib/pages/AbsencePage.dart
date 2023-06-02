import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widgets/ChampsSaisie.dart';
import 'package:squelette_mobile_parcours/widgets/Chargement.dart';

import '../controllers/AbsenceController.dart';
import 'Historique.dart';


class AbsencePage extends StatefulWidget {
  const AbsencePage({Key? key}) : super(key: key);

  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  var motifCtrl = TextEditingController();
  var dateAbsenceCtrl = TextEditingController(text: DateTime.now().toString());
  var error = "";
  var errorDate = "";
  var msg= "";
  bool isVisible = false;
  var now = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    error="";
    errorDate="";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: Stack(
        children: [_body(), Chargement(isVisible)],
      ),
    );
  }
  Widget _body(){
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome To", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
              Text("TimeKeep", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
            ),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Signaler mon absence", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ),
                Form(
                  child:Center(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(msg, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 10,
                            ),
                            ChampSaisie(ctrl: motifCtrl,
                                label: "Motif",
                                required: true,
                                prefixIcon: Icons.emoji_people,
                                isPassword: false
                            ),Text(error, style: TextStyle(color: Colors.red),),
                            SizedBox(
                              height: 10,
                            ),
                            DateTimePicker(
                              controller: dateAbsenceCtrl,
                              type: DateTimePickerType.date,
                              dateMask: 'd MMM yyyy',
                              //initialValue: DateTime.now().toString(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              icon: Icon(Icons.event, color: Colors.amber[900],),
                              dateLabelText: 'Date',
                              timeLabelText: "Hour",
                              decoration: InputDecoration(
                                  hintText: "Saisir...",
                                  prefixIcon: Icon(Icons.event),
                                  prefixIconColor: Colors.amber[900],
                                  border: _bordure(Colors.grey),
                                  focusedBorder: _bordure(Colors.amber),
                                    enabledBorder: _bordure(Colors.grey),
                              ),
                              cursorColor: Colors.amber[900],
                              selectableDayPredicate: (date) {
                                // Disable weekend days to select from the calendar
                                if (date.weekday == 6 || date.weekday == 7) {
                                  return false;
                                }
                                return true;
                              },
                              onChanged: (val) => val,
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => val,
                            ),
                            Text(errorDate, style: TextStyle(color: Colors.red),),
                            SizedBox(
                              height: 20,
                            ),
                            _buttonWidget(),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          )
        )
      ],
    );
  }
  OutlineInputBorder _bordure(MaterialColor _color) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: _color),
        borderRadius: BorderRadius.all(Radius.circular(5)));
  }
  Widget _buttonWidget() {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: _validerFormulaire,
        child: Text('Signaler', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
            )
        ),
      ),
    );
  }

  void _validerFormulaire() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()==true) {
      return;
    }
    isVisible = true;
    setState(() {});
    var ctrl = context.read<AbsenceController>();
    if(motifCtrl.text == "" || DateTime.parse(dateAbsenceCtrl.text).isBefore(now)){
      var tmp1="";
      var tmp2="";
      if(motifCtrl.text == "") tmp1 = "Le champ motif est obligatoire";
      if(DateTime.parse(dateAbsenceCtrl.text).isBefore(now))tmp2 = "La date ne doit pas être inférieure ou égale à la date actuelle";
      error = tmp1;
      errorDate = tmp2;
      isVisible = false;
      setState(() {});
      return null;
    }
    Map donneesAbsence = {"motif": motifCtrl.text, "date_absence": dateAbsenceCtrl.text, "user_id": 1};
    var statut = await ctrl.signalerAbsence(donneesAbsence);
    await Future.delayed(Duration(seconds: 5));
    isVisible = false;
    setState(() {});
    if(statut == true){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>Historique()));
    }else{
      msg = ctrl.absence?.message;
      motifCtrl.value = TextEditingValue(text: "");
      dateAbsenceCtrl.value = TextEditingValue(text: DateTime.now().toString());
      setState(() {});
    }
  }
}
