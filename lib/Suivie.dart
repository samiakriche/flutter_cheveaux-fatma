import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataTableSuivie extends StatefulWidget {
  String docId = "";

  FirestoreDataTableSuivie({required this.docId});
  @override
  _FirestoreDataTableState createState() => _FirestoreDataTableState();
}

class _FirestoreDataTableState extends State<FirestoreDataTableSuivie> {
  List<DataRow> _rowsStante = [];
  List<DataRow> _rowsSabot = [];
  List<DataRow> _rowsAlimentation = [];

  @override
  void initState() {
    super.initState();
    _fetchDataSante();
    _fetchDataSabot();
    _fetchDataAlimentation();
  }

  Future<void> _fetchDataSante() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('/ch2/' + widget.docId + '/sante')
        .get();

    List<DataRow> rows = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DataRow row = DataRow(
        cells: [
          DataCell(Text(data['vaccin'].toString())),
          DataCell(Text(data['visite'].toString())),
        ],
      );
      rows.add(row);
    });

    setState(() {
      _rowsStante = rows;
    });
  }

  Future<void> _fetchDataSabot() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('/ch2/' + widget.docId + '/sabot')
        .get();

    List<DataRow> rows = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DataRow row = DataRow(
        cells: [
          DataCell(Text(data['PES'].toString())),
          DataCell(Text(data['visite'].toString())),
        ],
      );
      rows.add(row);
    });

    setState(() {
      _rowsSabot = rows;
    });
  }

  Future<void> _fetchDataAlimentation() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('/ch2/' + widget.docId + '/alimentation')
        .get();

    List<DataRow> rows = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DataRow row = DataRow(
        cells: [
          DataCell(Text(data['foins'].toString())),
          DataCell(Text(data['bouchon'].toString())),
          DataCell(Text(data['vitamine'].toString()))
        ],
      );
      rows.add(row);
    });

    setState(() {
      _rowsAlimentation = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Data Table'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        DataTable(
          columns: [
            DataColumn(label: Text('Vaccin')),
            DataColumn(label: Text('Visite')),
          ],
          rows: _rowsStante,
        ),
        DataTable(
          columns: [
            DataColumn(label: Text('Produit entretien de sabots')),
            DataColumn(label: Text('Visite'))
          ],
          rows: _rowsSabot,
        ),
        DataTable(
          columns: [
            DataColumn(label: Text('Foin')),
            DataColumn(label: Text('Bouchon')),
            DataColumn(label: Text('Vitamine')),
          ],
          rows: _rowsAlimentation,
        )
      ])),
    );
  }
}
