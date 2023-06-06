import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apps/MonApplication.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  await GetStorage.init();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    print(details.stack);
    return Scaffold(
      body: Center(
        child: Text("Erreur inattendue"),
      ),
    );
  };

  runApp(MonApplication());
}
