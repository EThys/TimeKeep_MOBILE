import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/pages/AbsencePage.dart';
import 'package:squelette_mobile_parcours/pages/HistoriquePage.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AbsencePage.dart';
import 'HistoriquePage.dart';
class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  bool _showFab = true;
  var focusedDay = DateTime.now();
  var firstDay = DateTime(2015);
  var lastDay = DateTime(2025);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Absences"),
      ),
      body: _body(),
      floatingActionButton: _showFab
          ? FloatingActionButton(
        backgroundColor: Colors.amber[900],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> AbsencePage()));
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
      ],
    );
  }
  Widget _bottomAppBar(){
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.amber[900],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> StartedPage()));
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