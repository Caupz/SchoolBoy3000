import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:schoolboy3000/pages/subjectspage.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import '../../models/mainmodel.dart';
import 'package:schoolboy3000/pages/days/monday.dart';
import 'package:schoolboy3000/models/addToDay.dart';

class Mondayroute extends StatelessWidget {
  final String pageText;
  Mondayroute(this.pageText);
  String dropdownSubject = "Teoreetiline informaatika";
  String dropdownDay = "Monday";
  String selectedDay = "Monday";
  String subject = "Teoreetiline informaatika";
  DateTime startTime = new DateTime.now();
  DateTime endTime = new DateTime.now();
  String room = "NO-ROOM";

  String _time = "Not set";

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
        return new Scaffold(
          appBar: new AppBar(title: new Text(pageText),),
          body: Column(children: <Widget>[
            Container(
                color: Colors.white,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.all(25.0),
                child: new Text("Fill in your lesson plan for monday",
                  style: new TextStyle(fontSize: 20.0),)
            ),
            // päeva valik ka siin olemas, sest hardcodeme
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: DropdownButton<String>(
                  value: dropdownDay,
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
                    selectedDay = newValue;
                  },
                  items: <String>[
                    'Monday', 'Tuesday', 'Thursday', 'Wednesday', 'Friday', 'Saturday', 'Sunday'
                  ] // TODO dropdown saab subjectid db-st mis on lisatud subject pagelt
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
              ),
            ),
            // aine valimine
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: DropdownButton<String>(
                  value: dropdownSubject,
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
                    subject = newValue;
                  },
                  items: <String>[
                    'Teoreetiline informaatika',
                    'Tõenäosus teooria elemendid',
                    'Teaduslik mõtteviis'
                  ] // TODO dropdown saab subjectid db-st mis on lisatud subject pagelt
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
              ),
            ),
            // ruumi lisamine
            Container(
                padding: EdgeInsets.fromLTRB(175, 0, 25, 0),
                child: TextField(
                  onChanged: (String newValue) {
                    room = newValue;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Room'
                  ),
                )
            ),
            // tunni algusaja valimine
            Container(
                child: new FlatButton(
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 300.0,
                          ),
                          showTitleActions: true,
                          onConfirm: (time) {
                            startTime = time;
                            print('confirm $time');
                            _time = '${time.hour} : ${time.minute} : ${time.second}';
                          },
                          currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text('Choose the starting time',)
                )
            ),
            // tunni lõpuaja valimine
            Container(
                child: new FlatButton(
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          onConfirm: (time) {
                            print('confirm $time');
                            endTime = time;
                            print(endTime);
                            '${time.hour} : ${time.minute}';
                          },
                          currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text('Choose the ending time',)
                )
            ),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.all(13.0),
                  child: Text('Add subject to mondays plan',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    //tahad tagasi minna siis pop enne data savemist, muidu ei tööta
                    Navigator.of(context).pop();
                    model.AddToDay(-1, selectedDay, subject, startTime, endTime, room, true, true);
                   // Navigator.of(context).push(new MaterialPageRoute(
                       // builder: (BuildContext context) => new Monday("Monday")),);
                  },
                )
            ),
          ]),
        );
       }
    );
  }
}