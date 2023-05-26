import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/controllers/AbsenceController.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:squelette_mobile_parcours/pages/StartPage.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Signaler absences"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
            _body()
        ],
      ),
      bottomNavigationBar: _bottomAppBar(),
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
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }
                      return true;
                    },
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
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
Widget _bottomAppBar(){
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    color: Colors.blue,
    child: IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> StartedPage()));
            },
          ),


          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> HistoriquePage()));
            },
          ),
        ],
      ),
    ),
  );
}

  void _validerFormulaire() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()==true) {
      return;
    }
    var ctrl = context.read<AbsenceController>();
    Map donneesAbsence = {"motif": motif.text, "date_absence": dateAbsence.text, "user_id": int.parse('1')};
    var statut = await ctrl.signalerAbsence(donneesAbsence);
    await Future.delayed(Duration(seconds: 5));
    if(statut == true){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HistoriquePage()));
    }

  }
}
