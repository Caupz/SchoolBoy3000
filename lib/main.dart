import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'models/mainmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:schoolboy3000/models/subject.dart';

void main() {
  /*runApp(new MaterialApp(
    home: new HomePage()
  ));*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void getSubjects(MainModel model)  {
    Future<dynamic> subjects = AppDB.select("subject", "", null);

    subjects.then((value) {
        List<Map> list = value;

        for(int i = 0; i < list.length; i++) {
          int id = -1;
          String sem = "", name = "", teacher = "", info = "";

          list[i].forEach((key, value) {
            switch(key) {
              case "id": id = value; break;
              case "semester": sem = value; break;
              case "subject": name = value; break;
              case "teacher": teacher = value; break;
              case "info": info = value; break;
            }

          });
          debugPrint("subject id "+id.toString()+" name "+name);
          model.addSubjects(id, sem, name, teacher, info, false, false);
        }
      })
      .catchError((error) => () {
        debugPrint("getSubjects ERROR: $error");
      });
  }

  void getSubjectEntries(MainModel model) {
    Future<dynamic> items = AppDB.select("subject_entry", "", null);

    items.then((value) {
        List<Map> list = value;

        for(int i = 0; i < list.length; i++) {
          int id = -2;
          String day = "", sub = "", room = "";
          String stime, etime;

          list[i].forEach((key, value) {
            switch(key) {
              case "id": id = value; break;
              case "selected_day": day = value; break;
              case "subject": sub = value; break;
              case "start_time": stime = value; break;
              case "end_time": etime = value; break;
              case "room": room = value; break;
            }

          });
          debugPrint("subject id "+id.toString()+" name "+sub);
          model.addSubjectEntry(id, day, sub, stime, etime, room, false, false);
        }
      })
      .catchError((error) => () {
        debugPrint("getSubjects ERROR: $error");
      });
  }

  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();
    getSubjects(_model);

    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: HomePage(),
        ));
  }
}