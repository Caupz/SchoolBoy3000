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

  void getSubjects(MainModel model) {
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
          model.addSubjects(id, sem, name, teacher, info, false, false);
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