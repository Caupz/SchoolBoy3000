import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:schoolboy3000/models/subject.dart';
import 'package:schoolboy3000/models/subjectentry.dart';

class MainModel extends Model {
  //lessonplan to db
  List<SubjectEntry> _subjectEntries = new List<SubjectEntry>();

  List<SubjectEntry> get subjectEntries {
    return _subjectEntries;
  }

  void addSubjectEntry(int id, String selectedDay, String subject, String startTime, String endTime, String room, bool saveToDB, bool notifiy) {
    SubjectEntry entry = new SubjectEntry(id, selectedDay, subject, startTime, endTime, room);
    _subjectEntries.add(entry);

    if(saveToDB) {

      entry.id = null;
      debugPrint('SUBJECTENTRY');
      debugPrint('subjectentrylõpp' + entry.startTime + "start and end" + entry.endTime);
      String jsonStr = jsonEncode(entry);
      debugPrint('SUBJECTENTRY2');
      AppDB.insertInto("subject_entry", jsonStr);
      debugPrint('SUBJECTENTRY' +  entry.id.toString());debugPrint('SUBJECTENTRY' +  entry.id.toString());debugPrint('SUBJECTENTRY' +  entry.id.toString());debugPrint('SUBJECTENTRY' +  entry.id.toString());
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
  void updateDb(int id, String fieldToUpdate, String updateVal){
    //print("JDP");
    //print(subjects[0].id);
    AppDB.update("subject", fieldToUpdate, updateVal, "id", id);
    //AppDB.results();
  }

  void updateModelName(int id, String updateValue){
    subjects[id].subject  = updateValue;
  }

  void updateModelTeacher(int id, String updateValue){
    subjects[id].teacher = updateValue;
  }

  void updateModelSemester(int id, String updateValue){
    subjects[id].semester = updateValue;
  }
}