import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/subjectspage.dart';
import 'package:schoolboy3000/pages/semesterspage.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';
import 'package:flutter/services.dart';

class SemestersRoute extends StatelessWidget {
  final String pageText;
  SemestersRoute(this.pageText);
  String dropdownSemesterSeason = "AUTUMN";

  // Values from fields
  String semesterSeason = "AUTUMN";
  String semesterName = "NO-SEMESTER-NAME";
  int semesterOrder = 0;



  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return new Scaffold(
              appBar: new AppBar(title: new Text(pageText),),
              body: Column(children: <Widget>[
                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(25.0),
                    child: new Text("Fill in the semester fields", style: new TextStyle(fontSize: 30.0),)
                ),
                Container(
                  child: DropdownButton<String>(
                      value: dropdownSemesterSeason,
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
                        semesterSeason = newValue;
                      },
                      items: <String>['AUTUMN', 'SPRING']
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
                        semesterName = newValue;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Semester name'
                      ),
                    )
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String newValue) {
                        semesterOrder = int.parse(newValue);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Semester order'
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Add semester', style: TextStyle(fontSize: 20)),
                      onPressed: (){
                        model.addSemesters(-1, semesterName, semesterOrder, semesterSeason, true, true);
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SemestersPage("Semesters page")));
                      },
                    )
                ),
              ])
          );
        });
  }
}