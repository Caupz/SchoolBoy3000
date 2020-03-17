import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/homepage.dart';
import 'package:sqflite/sqflite.dart';

// More instructions: https://pub.dev/packages/sqflite

class AppDB {

  static connection() async {
    var db = await openDatabase('schoolboy.db');
    return db;
  }

  static close(db) async {
    await db.close();
  }

  /*
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');
  * */

  static insertInto() async {
    /*
    await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    print('inserted1: $id1');
    int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });
    * */
  }

  static update() async {
    /*
    int count = await database.rawUpdate(
    'UPDATE Test SET name = ?, value = ? WHERE name = ?',
    ['updated name', '9876', 'some name']);
    print('updated: $count');
    * */
  }

  static delete() async {
    /*
    count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);
    * */
  }

  static count() async {
    /*
    count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
    assert(count == 2);
    * */
  }

  static select() async {
    /*
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);
    assert(const DeepCollectionEquality().equals(list, expectedList));
    * */
  }
}