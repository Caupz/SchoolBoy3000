import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:schoolboy3000/models/subject.dart';
import 'package:schoolboy3000/models/subjectentry.dart';
import 'package:schoolboy3000/models/semester.dart';

class MainModel extends Model {
  //lessonplan to db
  List<SubjectEntry> _subjectEntries = new List<SubjectEntry>();

  List<SubjectEntry> get subjectEntries {
    return _subjectEntries;
  }

  void addSubjectEntry(int id, String selectedDay, String subject, String startTime, String endTime, String room, String transportType, String departureTime, bool saveToDB, bool notifiy) {
    SubjectEntry entry = new SubjectEntry(id, selectedDay, subject, startTime, endTime, room, transportType, departureTime);
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
    AppDB.update("subject", fieldToUpdate, updateVal, "id", id + 1);
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

//-----------------------------------------------------------------------------------------
//semesters to db
  List<Semester> _semesters = new List<Semester>();

  List<Semester> get semesters {
    return _semesters;
  }

  void addSemesters(int id, String semesterName, int semesterOrder, String semesterSeason, bool saveToDB, bool notifiy) {
    Semester semester = new Semester(id, semesterName, semesterOrder, semesterSeason);
    _semesters.add(semester);

    if(saveToDB) {
      semester.id = null;
      String jsonStr = jsonEncode(semester);
      AppDB.insertInto("semester", jsonStr);
    }

    if(notifiy) {
      notifyListeners();
    }
  }
  void updateSemesterDb(int id, String fieldToUpdate, String updateVal){
    AppDB.update("semester", fieldToUpdate, updateVal, "id", id);
  }

  void updateModelSemesterName(int id, String updateValue){
    semesters[id].semesterName  = updateValue;
  }

  void updateModelSemesterOrder(int id, String updateValue){
    semesters[id].semesterOrder = int.parse(updateValue);
  }

  void updateModelSemesterSeason(int id, String updateValue){
    semesters[id].semesterSeason = updateValue;
  }
}


