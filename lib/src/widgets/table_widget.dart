import 'package:flutter/material.dart';
import 'package:workapp/src/models/person_model.dart';
import 'package:workapp/src/services/person_service.dart';

// ignore: non_constant_identifier_names
Widget BuildTableData() {
  const _columns = <DataColumn>[
    DataColumn(
      label: Text(
        'Name',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    DataColumn(
      label: Text(
        'LastName',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    DataColumn(
      label: Text(
        'Document',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
  ];

  _mountTableRows(List<Person> list) {
    return <DataRow>[
      for (var p in list)
        DataRow(
          cells: <DataCell>[
          DataCell(Text(p.name)),
          DataCell(Text(p.lastName)),
          DataCell(Text(p.document)),
        ],
      )
    ];
  }

  return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12, width: 3)),
      child: FutureBuilder(
          future: persons(),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              return Center(
                  child: DataTable(
                      columns: _columns,
                      rows: _mountTableRows(snapshot.data as List<Person>)));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }));
}
