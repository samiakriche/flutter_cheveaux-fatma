import 'package:flutter/material.dart';
import 'Equipe2.dart';
import 'Equipe3.dart';
import 'Login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cheveaux/Login.dart';
import 'firebase_options.dart';
import 'welcome.dart';
import 'Equipe.dart';
import 'Cavalier.dart';
import 'Home.dart';
import 'Signup.dart';
import 'Proprietaire.dart';
import 'Entrenaire.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/equi3',
        routes: {
          '/entre': (context) => Entrenaire(),
          '/pro': (context) => Proprietaire(),
          '/equi': (context) => Equipe(),
          '/cav': (context) => Cavalier(),
          '/chek': (context) => Welcome(),
          '/login': (context) => Login(),
          '/home': (context) => Home(),
          '/signup': (context) => Signup(),
          '/equi2': (context) => CasesList(),
          '/equi3': (context) => FirestoreDataTable()
        });
  }
}
