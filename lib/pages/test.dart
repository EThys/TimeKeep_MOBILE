import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _AppState();
}

class _AppState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      //appBar: AppBar(title: Text("Seance 1", style: TextStyle(),textAlign: TextAlign.center,), elevation: 0.0,),
      body: Column(
        children: [
          //Text("Jacques"),
          //Text("Flandry"),
          //Text("Pierrot")
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text("Fasi L1", style: TextStyle(fontSize: 50),),
                //Text("Authentification")
                Text(
                  "FASI L1",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Authentification",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white54),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        100,
                      ),
                      topLeft: Radius.circular(100))),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.2),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.indigo,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "username",
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.2),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.indigo,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "password",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.2),
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: ElevatedButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.send, color: Colors.white,),
                      label: Text("Send", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







