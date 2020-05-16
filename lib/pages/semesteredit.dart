import 'package:flutter/material.dart';
import '../models/mainmodel.dart';

class SemesterEdit {

  static createSemesterNameEditDialog(BuildContext ctxt, String semesterName, int id, MainModel model) {
    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context) {
      return AlertDialog(
        title: Text("Edit semester name: "),
        content: TextFormField(
            decoration: InputDecoration(
              hintText: semesterName,
            ),
            controller: customController
        ),
        actions: <Widget>[
          RaisedButton(
            elevation: 5.0,
            child: Text("Save"),
            onPressed: () {
              model.updateSemesterDb(id, "semesterName", customController.text);
              model.updateModelSemesterName(id, customController.text);
              Navigator.of(context).pop();
            },
          )
        ],

      );
    });
  }

  static createSemesterOrderEditDialog(BuildContext ctxt, int semesterOrder, int id, MainModel model){

    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context){
      return AlertDialog(
        title: Text("Edit semester order: "),
        content: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: semesterOrder.toString(),
          ),
          controller: customController,

        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Save"),
            onPressed: (){
              model.updateSemesterDb(id, "semesterOrder", customController.text);
              model.updateModelSemesterOrder(id, customController.text);
              Navigator.of(context).pop();
            },
          )
        ],

      );
    });
  }

  static createSemesterSeasonEditDialog(BuildContext ctxt, String semesterSeason, int id, MainModel model){

    TextEditingController customController = TextEditingController();

    return showDialog(context: ctxt, builder: (context){
      return AlertDialog(
        title: Text("Edit semester season: "),
        content: Text("Autumn or spring?"),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("AUTUMN"),
            onPressed: (){
              print(id);
              model.updateSemesterDb(id, "semesterSeason", "AUTUMN");
              model.updateModelSemesterSeason(id, "AUTUMN");
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text("SPRING"),
            onPressed: (){
              print(id);
              model.updateSemesterDb(id, "semesterSeason", "SPRING");
              model.updateModelSemesterSeason(id, "SPRING");
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

}