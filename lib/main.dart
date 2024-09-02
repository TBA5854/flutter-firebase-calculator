import 'package:fireauth/fireauth.da''rt';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calculator/page/calculator/home.dart' as calc;

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
    darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.greenAccent,
        brightness: Brightness.dark),
    initialRoute: "calc",
    routes: {
      "calc": (context) => const calc.Home(),
      // "stop":(context) => const stop.Home(),
    },
    // home: const Home(),
  ));
}
