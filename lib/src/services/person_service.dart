import 'package:sqflite/sqflite.dart';
import 'package:workapp/src/infra/db_infra.dart';
import 'package:workapp/src/models/person_model.dart';

Future<void> insertPerson(Person person) async {
  final db = await database();

  await db.insert(
    'person',
    person.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  db.close();
}

Future<List<Person>> persons() async {
  final db = await database();

  final List<Map<String, dynamic>> maps =
      await db.rawQuery("SELECT * FROM person");
  db.close();

  print(maps.length);

  List<Person> list = [];
  for (int i = 0; i < maps.length; i++) {
    list.add(Person(
      id: maps[i]["id"].toString(),
      name: maps[i]["name"].toString(),
      lastName: maps[i]["lastName"].toString(),
      document: maps[i]["document"].toString()));
  }
  return list;
}
