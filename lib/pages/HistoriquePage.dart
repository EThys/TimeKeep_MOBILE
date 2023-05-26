import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squelette_mobile_parcours/controllers/AbsenceController.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}


class _HistoriquePageState extends State<HistoriquePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var absenceCtrl = context.read<AbsenceController>();
      absenceCtrl.recuperAbsences();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
  AppBar _appBar(){
    var absenceCtrl = context.watch<AbsenceController>();
    return AppBar(
      title: Text('Mes absences (${absenceCtrl.listeAbsences.length})',
      ),
      centerTitle: true,
    );
  }
  Widget _body(){
    var absenceCtrl = context.watch<AbsenceController>();
    print(absenceCtrl.listeAbsences);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(10.0)),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: absenceCtrl.listeAbsences.length,
              itemBuilder: (ctx, i){
                var absence = absenceCtrl.listeAbsences[i];
                return ListTile(
                  title: Text('${absence.date_absence}'),
                  subtitle: Text('${absence.motif}'),
                  trailing: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.cancel)
                  ),
                );
              }
            )
        )
      ],
    );
  }
}
