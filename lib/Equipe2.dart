import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class CasesList extends StatelessWidget {
  List<Map> l = List.empty();
  CasesList({super.key}) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference cheveaux = firestore.collection('ch2');
    cheveaux.add({
      "nom": "Sam",
      "race": "ONC",
      "robe": "M.Bai",
      "date naisance": "2009"
    });
    cheveaux.add({
      "nom": "Mayouta",
      "race": "ONC",
      "robe": "F.gris",
      "date naisance": "2009"
    });
    cheveaux.add({
      "nom": "Jarray",
      "race": "AR",
      "robe": "M.Alezan",
      "date naisance": "2015"
    });
    // cases = {"nom": "chevalnom", "Race": "noir", "Robe": "Robe cheval"};
    cheveaux.get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        //   print('${docSnapshot.id} => ${docSnapshot.data()}');
        Map v = docSnapshot.data() as Map;
        // print(v);
        l.add(v);
      }
      print(this.l);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Table Sample')),
            body: ClipRect(
              child: Table(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  children: [
                    for (var i = 0; i < 2; i++)
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(child: new Text("22")),
                              Expanded(child: new Text("55")),
                            ],
                          ),
                        )
                      ])
                  ]),
            )));
  }
}
