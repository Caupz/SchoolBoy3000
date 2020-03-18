import 'package:sqflite/sqflite.dart';
import 'dart:convert';

// More instructions: https://pub.dev/packages/sqflite

class AppDB {
  var db;

  static open() async {
    var _db = await openDatabase('schoolboy.db');
    return _db;
  }

  close() async {
    await db.close();
  }

  insertInto(String jsonStr) async {
    final Map parsed = json.decode(jsonStr);

    await db.transaction((txn) async {
      String fields = "";
      String params = "";
      List<dynamic> values = new List<dynamic>();

      parsed.forEach((k, v) => () {
        fields += k+",";
        params += "?,";
        values.add(v);
      });

      fields = removeLastChar(fields);
      params = removeLastChar(params);

      int result = await txn.rawInsert(
          'INSERT INTO Test('+fields+') VALUES('+params+')',
          values
      );
      return result;
    });
  }

  static String removeLastChar(String str) {
    if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  update<E>(String tableName, String fieldToUpdate, E updateVal, String conditionField, E conditionVal) async {
    int count = await db.rawUpdate(
        'UPDATE '+tableName+' SET '+fieldToUpdate+' = ? WHERE '+conditionField+' = ?',
        [updateVal, conditionVal]
    );
    return count;
  }

  delete<E>(String tableName, String conditionField, E conditionVal) async {
    int count = await db.rawDelete('DELETE FROM '+tableName+' WHERE '+conditionField+' = ?', [conditionVal]);
    return count;
  }

  count<E>(String tableName, String conditionField, E conditionVal) async {
    int _count;
    if(conditionField != "" && conditionVal != null) {
      _count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM '+tableName+' WHERE '+conditionField+' = ?', [conditionVal]));
    } else {
      _count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM '+tableName));
    }
    return _count;
  }

  select<E>(String tableName, String conditionField, E conditionVal) async {
    List<Map> list;

    if(conditionField != "" && conditionVal != null) {
      list = await db.rawQuery('SELECT * FROM '+tableName+' WHERE '+conditionField+' = ?', [conditionVal]);
    } else {
      list = await db.rawQuery('SELECT * FROM '+tableName);
    }
    return list;
  }
}