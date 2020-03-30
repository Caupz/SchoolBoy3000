import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

// More instructions: https://pub.dev/packages/sqflite

class AppDB {
  static runMigration(Database db) async {
    //await db.execute('DROP TABLE subject;');
    await db.execute('CREATE TABLE IF NOT EXISTS subject (id INTEGER PRIMARY KEY AUTOINCREMENT, weekday TEXT NOT NULL, semester TEXT NOT NULL, subject TEXT NOT NULL, teacher TEXT NOT NULL, info TEXT NOT NULL);');
    debugPrint('EXECUTING MIGRATIONS DONE');
  }

  static insertInto(String tableName, String jsonStr) async {
    //debugPrint('insertInto PARSED STR: $jsonStr');
    Map<String, dynamic> parsed = jsonDecode(jsonStr);

    var db = await openDatabase('schoolboy.db');
    runMigration(db);

    await db.transaction((txn) async {
      String fields = "";
      String params = "";
      var values = new List<dynamic>();

      //debugPrint('PARSED DATA:');
      parsed.map((key, val) {
        //debugPrint('KEY $key VAL $val');

        fields += "'$key',";
        params += "?,";
        values.add(val);

        return new MapEntry(key, val);
      });

      fields = removeLastChar(fields);
      params = removeLastChar(params);

      int result = await txn.rawInsert(
          'INSERT INTO $tableName($fields) VALUES($params)',
          values
      );
      return result;
    });

    await db.close();
  }

  static String removeLastChar(String str) {
    if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  static update<E>(String tableName, String fieldToUpdate, E updateVal, String conditionField, E conditionVal) async {
    var db = await openDatabase('schoolboy.db');
    int count = await db.rawUpdate(
        'UPDATE '+tableName+' SET '+fieldToUpdate+' = ? WHERE '+conditionField+' = ?',
        [updateVal, conditionVal]
    );
    await db.close();
    return count;
  }

  static delete<E>(String tableName, String conditionField, E conditionVal) async {
    var db = await openDatabase('schoolboy.db');
    int count = await db.rawDelete('DELETE FROM '+tableName+' WHERE '+conditionField+' = ?', [conditionVal]);
    await db.close();
    return count;
  }

  static count<E>(String tableName, String conditionField, E conditionVal) async {
    var db = await openDatabase('schoolboy.db');
    int _count;
    if(conditionField != "" && conditionVal != null) {
      _count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM '+tableName+' WHERE '+conditionField+' = ?', [conditionVal]));
    } else {
      _count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM '+tableName));
    }
    await db.close();
    return _count;
  }

  static select<E>(String tableName, String conditionField, E conditionVal) async {
    List<Map> list;
    var db = await openDatabase('schoolboy.db');
    runMigration(db);

    if(conditionField != "" && conditionVal != null) {
      list = await db.rawQuery('SELECT * FROM $tableName WHERE $conditionField = ?', [conditionVal]);
      debugPrint('SELECT * FROM $tableName WHERE $conditionField = ?');
    } else {
      list = await db.rawQuery('SELECT * FROM $tableName');
      debugPrint('SELECT * FROM $tableName');
    }

    debugPrint("RESULT DATA");
    debugPrint(jsonEncode(list));
    debugPrint("RESULT DATA length "+list.length.toString());

    /*
    for(int i = 0; i < list.length; i++) {
      debugPrint("RESULT DATA $i");

      list[i].forEach((key, value) {
        debugPrint("KEY $key VALUE $value");
      });
    }
    */

    await db.close();
    return list;
  }
}