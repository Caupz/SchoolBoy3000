import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:schoolboy3000/models/subject.dart';
import 'package:schoolboy3000/models/addToDay.dart';

class MainModel extends Model {
  //lessonplan to db
  List<addToDay> _addtoday = new List<addToDay>();

  List<addToDay> get addtoday {
    return _addtoday;
  }

  void AddToDay(int id, String selectedDay, String subject, DateTime startTime, DateTime endTime, String room, bool saveToDB, bool notifiy) {
    addToDay addtoday = new addToDay(id, selectedDay, subject, startTime, endTime, room);
    _addtoday.add(addtoday);

    if(saveToDB) {
      addtoday.id = null;
      String jsonStr = jsonEncode(addtoday);
      AppDB.insertInto("addtoday", jsonStr);
    }

    if(notifiy) {
      notifyListeners();
    }
  }
  //-----------------------------------------------------------------------------------------
  //subjects to db
  List<Subject> _subjects = new List<Subject>();

  List<Subject> get subjects {
    return _subjects;
  }

  void addSubjects(int id, String semester, String name, String teacher, String info, bool saveToDB, bool notifiy) {
    Subject subject = new Subject(id, semester, name, teacher, info);
    _subjects.add(subject);

    if(saveToDB) {
      subject.id = null;
      String jsonStr = jsonEncode(subject);
      AppDB.insertInto("subject", jsonStr);
    }

    if(notifiy) {
      notifyListeners();
    }
  }
}