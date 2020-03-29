import 'package:flutter/material.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';

class SubjectsRoute extends StatelessWidget {
  final String pageText;
  SubjectsRoute(this.pageText);
  String dropdownValue = "Monday";
  String dropdownSemester = "S20";

  // Values from fields
  String weekDay = "Monday";
  String semester = "S20";
  String subjectName = "NO-SUBJECT-NAME";
  String teacherName = "NO-TEACHER-NAME";
  String additionalInfo = "NO-INFO";

  void addNewSubject(wday, sem, subjName, teachName, additInfo) {
    var subjectData = {"weekday": wday, "semester": sem, "subject": subjName, "teacher": teachName, "info":additInfo};
    String jsonStr = jsonEncode(subjectData);
    debugPrint('PARSED STR: $jsonStr');
    AppDB.insertInto("subject", jsonStr);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(pageText),),
        body: Column(children: <Widget>[
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(25.0),
                child: new Text("Fill in the subject fields", style: new TextStyle(fontSize: 30.0),)
            ),
          Container(
            child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Colors.blueAccent
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String newValue) {
                  weekDay = newValue;
                },
                items: <String>['Monday', 'Thuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()
            ),
          ),
          Container(
            child: DropdownButton<String>(
                value: dropdownSemester,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Colors.blueAccent
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String newValue) {
                  semester = newValue;
                },
                items: <String>['S20', 'A20', 'S21'] // TODO gettida siia semestrite listist itemid ja ülesse String Valueks salvestab andmebaasi meelde mis viimati valiti
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                onChanged: (String newValue) {
                  subjectName = newValue;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Subject name'
                ),
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                onChanged: (String newValue) {
                  teacherName = newValue;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Teacher'
                ),
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                onChanged: (String newValue) {
                  additionalInfo = newValue;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Additional info (links, notes, etc)'
                ),
              )
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text('Add subject', style: TextStyle(fontSize: 20)),
                onPressed: (){
                  addNewSubject(weekDay, semester, subjectName, teacherName, additionalInfo);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SubjectsRoute("Subjects page")));
                },
              )
          ),
        ])
    );
  }
}