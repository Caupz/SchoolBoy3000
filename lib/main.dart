import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'models/mainmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:schoolboy3000/models/subject.dart';

void main() {
  /*runApp(new MaterialApp(
    home: new HomePage()
  ));*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void printSubjects(List<Subject> subs) {
    debugPrint("printSubjects INIT");
    for(int i = 0; i < subs.length; i++) {
      debugPrint("printSubjects $i ${subs[i].name}");
    }
  }

  void getSubjects(MainModel model) {
    debugPrint("getSubjects INIT");
    Future<dynamic> subjects = AppDB.select("subject", "", null);
    //debugPrint("getSubjects before then");

    subjects.then((value) {
        //debugPrint("getSubjects then 1");
        List<Map> list = value;
        //debugPrint("getSubjects then 2");

        for(int i = 0; i < list.length; i++) {
          //debugPrint("getSubjects I: $i");
          int id = -1;
          String wday = "", sem = "", name = "", teacher = "", info = "";
          // "weekday": weekday, "semester": semester, "subject": subject, "teacher": teacher, "info":info};

          list[i].forEach((key, value) {
            switch(key) {
              case "id": id = value; break;
              case "weekday": wday = value; break;
              case "semester": sem = value; break;
              case "subject": name = value; break;
              case "teacher": teacher = value; break;
              case "info": info = value; break;
            }

          });
          model.addSubjects(id, wday, sem, name, teacher, info, false, false);
          debugPrint("getSubjects DATA: $wday | $sem | $name | $teacher | $info");
        }

        //printSubjects(model.subjects);

        debugPrint("getSubjects ENDED");
        // value on List<Map>
        //debugPrint(value);
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