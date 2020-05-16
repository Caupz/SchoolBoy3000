import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

// More instructions: https://pub.dev/packages/sqflite



class AppDB {
  static runMigration(Database db) async {
    //await db.execute('DROP TABLE subject;');
    //await db.execute("DROP TABLE subject_entry;");
    //await db.execute("DROP TABLE semester;");
    await db.execute('CREATE TABLE IF NOT EXISTS subject (id INTEGER PRIMARY KEY AUTOINCREMENT, semester TEXT NOT NULL, subject TEXT NOT NULL, teacher TEXT NOT NULL, info TEXT NOT NULL);');
    await db.execute('CREATE TABLE IF NOT EXISTS subject_entry (id INTEGER PRIMARY KEY AUTOINCREMENT, selected_day TEXT NOT NULL, subject TEXT NOT NULL, start_time TEXT NOT NULL, end_time TEXT NOT NULL, room TEXT NOT NULL);');
    await db.execute('CREATE TABLE IF NOT EXISTS semester (id INTEGER PRIMARY KEY AUTOINCREMENT, semester_name TEXT NOT NULL, semester_order INTEGER NOT NULL, semester_season TEXT NOT NULL);');
    debugPrint('EXECUTING MIGRATIONS DONE');
  }

  static insertInto(String tableName, String jsonStr) async {
    Map<String, dynamic> parsed = jsonDecode(jsonStr);
    var db = await openDatabase('schoolboy.db');
    runMigration(db);

    int insertedId = await db.transaction((txn) async {
      String fields = "";
      String params = "";
      var values = new List<dynamic>();

      parsed.map((key, val) {
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
    return insertedId;
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
      //debugPrint('SELECT * FROM $tableName WHERE $conditionField = ?');
    } else {
      list = await db.rawQuery('SELECT * FROM $tableName');
      //debugPrint('SELECT * FROM $tableName');
    }

    /* Testimiseks, et näha mis sisu tuli tagasi.
    debugPrint(jsonEncode(list));

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