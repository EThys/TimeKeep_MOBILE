import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/controllers/AbsenceController.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';

class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AbsenceController()),
        ChangeNotifierProvider(create: (_)=>AbsenceController()),
        ChangeNotifierProvider(create: (_)=>AbsenceController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.StartedRoutes,
      ),
    );
  }
}
