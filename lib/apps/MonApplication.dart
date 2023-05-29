import 'package:flutter/material.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';

class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.TemplateRoutes,
      ),
    );
  }
}
