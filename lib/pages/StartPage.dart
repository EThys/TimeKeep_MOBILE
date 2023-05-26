import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;
  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Absences"),
      ),
      body: _body(),
      floatingActionButton: _showFab
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> AbsenceFormPage()));
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _bottomAppBar(),
    );
  }
  Widget _body(){
    return ListView(
      padding: const EdgeInsets.only(bottom: 88),
      children: <Widget>[
        SwitchListTile(
          title: const Text(
            'Floating Action Button',
          ),
          value: _showFab,
          onChanged: _onShowFabChanged,
        ),
        SwitchListTile(
          title: const Text('Notch'),
          value: _showNotch,
          onChanged: _onShowNotchChanged,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Floating action button position'),
        ),
        RadioListTile<FloatingActionButtonLocation>(
          title: const Text('Docked - End'),
          value: FloatingActionButtonLocation.endDocked,
          groupValue: _fabLocation,
          onChanged: _onFabLocationChanged,
        ),
        RadioListTile<FloatingActionButtonLocation>(
          title: const Text('Docked - Center'),
          value: FloatingActionButtonLocation.centerDocked,
          groupValue: _fabLocation,
          onChanged: _onFabLocationChanged,
        ),
        RadioListTile<FloatingActionButtonLocation>(
          title: const Text('Floating - End'),
          value: FloatingActionButtonLocation.endFloat,
          groupValue: _fabLocation,
          onChanged: _onFabLocationChanged,
        ),
        RadioListTile<FloatingActionButtonLocation>(
          title: const Text('Floating - Center'),
          value: FloatingActionButtonLocation.centerFloat,
          groupValue: _fabLocation,
          onChanged: _onFabLocationChanged,
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
        )
      ],
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
}