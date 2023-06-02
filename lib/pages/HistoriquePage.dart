import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/widgets/Chargement.dart';

import '../controllers/AbsenceController.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  var succesMessage = "";
  bool isVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var absenceCtrl = context.read<AbsenceController>();
      absenceCtrl.recuperAbsences();
    });
  }
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Stack(
        children: [_body(formattedDate), Chargement(isVisible)],
      ),
    );
  }
  Widget _body(String dateFormatted){
    var absenceCtrl = context.watch<AbsenceController>();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber[900],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(50)),
          ),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(

                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                            dateFormatted,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white
                            )
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: (){},
                          iconSize: 30.0,
                          hoverColor: Colors.grey,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    margin: EdgeInsets.only(left: 15.0, right: 15.0,),
                  ),
                  Container(
                    child: Text(
                      'Mon historique',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        color: Colors.white
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 40.0, left: 15.0),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))

                ),
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _text("Présences"),
                        _text("17"),
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text("Absences"),
                        _text("${absenceCtrl.listeAbsences.length}"),
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text("Congés"),
                        _text("7"),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(succesMessage)
        ),

        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: absenceCtrl.listeAbsences.length,
              itemBuilder: (ctx, i){
                var absence = absenceCtrl.listeAbsences[i];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle_rounded, color: Colors.greenAccent,size: 10.0,),
                            Text('${absence.date_absence}', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15.0 ),),
                          ],
                        ),
                        IconButton(
                            onPressed: () async{
                              isVisible = true;
                              setState(() {});
                              var ctrl = context.read<AbsenceController>();
                              Map toCancel = {"id":absence.id};
                              var response = await ctrl.signalerAbsence(toCancel, cancel: true);
                              await Future.delayed(Duration(seconds: 5));
                              absenceCtrl.listeAbsences.removeAt(absenceCtrl.listeAbsences.indexOf(absence));
                              isVisible = false;
                              succesMessage = "Absence annulée";
                              setState(() {});


                            },
                            icon: Icon(Icons.cancel_outlined, size: 20.0,)
                        )
                      ],
                    ),
                    subtitle: Text('${absence.motif}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0 )),
                  ),
                );
              }
          )
        )
      ],
    );
  }
  void cancel() async{

  }
  Widget _text(String text){
    return Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0));
  }
}
