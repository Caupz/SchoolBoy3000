import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/subjectsroute.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';
import 'package:schoolboy3000/models/subject.dart';

class SubjectsPage extends StatelessWidget {
  final String pageText;
  SubjectsPage(this.pageText);

  void printSubjects(List<Subject> subs) {
    debugPrint("printSubjects INIT");
    for(int i = 0; i < subs.length; i++) {
      debugPrint("printSubjects $i ${subs[i].name}");
    }
  }

  Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    debugPrint("buildBody INIT 1 ${model.subjects.length}");
    //printSubjects(model.subjects);

    //debugPrint('buildBody: $index LENGTH ${model.subjects.length}');

    List<Subject> list = model.subjects;

    for(int i = 0; i < list.length; i++) {
      debugPrint('buildBody FOR: $i');
      String subjectData = "ID[${list[i].id.toString()}] NAME[${list[i].name.toString()}]";
      debugPrint('buildBody: NAME [$subjectData]');

      return new Text("$subjectData");
    }

    return new Text("No subjects");
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return new Scaffold(
              appBar: new AppBar(title: new Text(pageText),),
              body: Column(children: <Widget>[
                Stack(children: [
                  Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(25.0),
                      child: new Text(pageText, style: new TextStyle(fontSize: 40.0),)
                  )
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Add a new subject', style: TextStyle(fontSize: 20)),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SubjectsRoute("Subjects route")));
                      },
                    )
                ),
                new ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.subjects.length,
                    itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index, model)
                )
              ])
          );
        });
  }
}