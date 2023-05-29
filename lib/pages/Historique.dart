import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La seance pratique n°1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Historique(),
    );
  }
}

class Historique extends StatefulWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _body(formattedDate),
    );
  }
  Widget _body(String dateFormatted){
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
                        _text("Présence"),
                        _text("117"),
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text("Absence"),
                        _text("17"),
                      ],
                    ),Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text("Congé"),
                        _text("7"),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        Expanded(
            child: Container(

            )
        )
      ],
    );
  }
  Widget _text(String text){
    return Text(text, style: TextStyle(color: Colors.white));
  }
}
