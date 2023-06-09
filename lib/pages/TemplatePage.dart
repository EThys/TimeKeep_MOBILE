import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:path/path.dart';
import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _body(context),
      appBar: _appBar(),
    );
  }
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: Text("Absences"),
      actions: [],
    );
  }
  Widget _body(BuildContext context){
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AbsencePage()));
                },
                style: style,
                child: Text('Signaler absence'

                )
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>HistoriquePage()));
                },
                style: style,
                child: Text('Historique des absences'

                )
            )
          ],
        ),
      ),
    );
  }

}



