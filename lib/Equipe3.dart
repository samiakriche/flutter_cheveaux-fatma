import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Suivie.dart';

class FirestoreDataTable extends StatefulWidget {
  @override
  _FirestoreDataTableState createState() => _FirestoreDataTableState();
}

class _FirestoreDataTableState extends State<FirestoreDataTable> {
  List<DataRow> _rows = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('ch2').get();

    List<DataRow> rows = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DataRow row = DataRow(
        cells: [
          DataCell(Text(doc.id)),
          DataCell(Text(data['nom'].toString())),
          DataCell(Text(data['race'].toString())),
          DataCell(Text(data['robe'].toString())),
          DataCell(Text(data['date naisance'].toString())),
          DataCell(
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FirestoreDataTableSuivie(docId: doc.id.toString())),
                );
                // Button action
                print("");
              },
              child: Text('Button'),
            ),
          ),
        ],
      );
      rows.add(row);
    });

    setState(() {
      _rows = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Data Table'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Document ID')),
            DataColumn(label: Text('Nom')),
            DataColumn(label: Text('Race')),
            DataColumn(label: Text('Robe')),
            DataColumn(label: Text('Date naissance')),
            DataColumn(label: Text('Suivie')),
          ],
          rows: _rows,
        ),
      ),
    );
  }
}
