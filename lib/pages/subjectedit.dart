import 'package:flutter/material.dart';
import '../models/mainmodel.dart';



class SubjectEdit {

    static createClassroomEditDialog(BuildContext ctxt, String semester, int id, MainModel model) {
    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context) {
      return AlertDialog(
        title: Text("Edit semester: "),
        content: TextFormField(
            decoration: InputDecoration(
              hintText: semester,
            ),
            controller: customController
        ),
        actions: <Widget>[
          RaisedButton(
            elevation: 5.0,
            child: Text("Save"),
            onPressed: () {
              model.updateDb(id, "semester", customController.text);
              model.updateModelSemester(id, customController.text);
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

   static createSubjectEditDialog(BuildContext ctxt, String subjectName, int id, MainModel model){

    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context){
      return AlertDialog(
        title: Text("Edit subject: "),
        content: TextFormField(
          decoration: InputDecoration(
            hintText: subjectName,
          ),
          controller: customController,

        ),
        actions: <Widget>[
          RaisedButton(
            elevation: 5.0,
            child: Text("Save"),
            onPressed: (){
              model.updateDb(id, "subject", customController.text);
              model.updateModelName(id, customController.text);
              Navigator.of(context).pop();
            },
          )
        ],

      );
    });
  }

   static createProfessorEditDialog(BuildContext ctxt, String teacherName, int id, MainModel model){

    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context){
      return AlertDialog(
        title: Text("Edit professor : "),
        content: TextFormField(
            decoration: InputDecoration(
              hintText: teacherName,
            ),
            controller: customController
        ),
        actions: <Widget>[
          RaisedButton(
            elevation: 5.0,
            child: Text("Save"),
            onPressed: (){
              model.updateDb(id, "teacher", customController.text);
              model.updateModelTeacher(id, customController.text);
              Navigator.of(context).pop();
            },
          )
        ],

      );
    });
  }

}