import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widgets/ChampsSaisie.dart';

import '../controllers/AbsenceController.dart';
import 'Historique.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Absence(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Absence extends StatefulWidget {
  const Absence({Key? key}) : super(key: key);

  @override
  State<Absence> createState() => _AbsenceState();
}

class _AbsenceState extends State<Absence> {
  var motif = TextEditingController();
  var dateAbsence = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: _body(),
    );
  }
  Widget _body(){
    return Column(
      children: [
        Container(
          height: 200,
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
                              dateMask: 'd MMM yyyy',
                              initialValue: DateTime.now().toString(),
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
                                    enabledBorder: _bordure(Colors.blueGrey)
                              ),
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
    var ctrl = context.read<AbsenceController>();
    Map donneesAbsence = {"motif": motif.text, "date_absence": dateAbsence.text, "user_id": int.parse('1')};
    var statut = await ctrl.signalerAbsence(donneesAbsence);
    await Future.delayed(Duration(seconds: 5));
    if(statut == true){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>Historique()));
    }

  }
}
