import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/subjectsroute.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';
import 'package:schoolboy3000/models/subject.dart';

class SubjectsPage extends StatelessWidget {
  final String pageText;
  SubjectsPage(this.pageText);

  Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    List<Subject> list = model.subjects;

    int id = list[index].id; // TODO seda kasutada onPressed muutmisse minnes.
    String subjectName = list[index].name;
    String teacherName = list[index].teacher;
    String semester = list[index].semester;
    String weekday = list[index].weekday;

    return new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: RaisedButton(
          padding: EdgeInsets.all(15.0),
          child: Row(children: <Widget>[
            Expanded(child: Text(semester, textAlign: TextAlign.center)),
            Expanded(child: Text(weekday, textAlign: TextAlign.center)),
            Expanded(child: Text(subjectName, textAlign: TextAlign.center)),
            Expanded(child: Text(teacherName, textAlign: TextAlign.center)),
            ],
          ),
          onPressed: (){
            // TODO minna vastava variable id ehk list[index].id subject muutmisse.
          },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return new Scaffold(
              appBar: new AppBar(title: new Text(pageText),),
              body: Column(children: <Widget>[
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
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text('All subjects:', style: TextStyle(fontSize: 20))
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