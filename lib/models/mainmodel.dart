import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:schoolboy3000/models/subject.dart';

class MainModel extends Model {
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