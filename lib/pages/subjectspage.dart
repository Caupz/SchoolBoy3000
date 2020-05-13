import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/subjectsroute.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';
import 'package:schoolboy3000/models/subject.dart';
import 'package:schoolboy3000/pages/subjectedit.dart';

class SubjectsPage extends StatelessWidget {
  final String pageText;
  SubjectsPage(this.pageText);

  Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    List<Subject> list = model.subjects;

    int id = list[index].id; // TODO seda kasutada onPressed muutmisse minnes.
    String subjectName = list[index].subject;
    String teacherName = list[index].teacher;
    String semester = list[index].semester;

    return new Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: new RaisedButton(
                child: Text(semester),
                onPressed: () {
                  SubjectEdit.createClassroomEditDialog(ctxt, semester, index, model);
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Expanded(
            child: new RaisedButton(
                child: Text(subjectName),
                onPressed: () {
                  SubjectEdit.createSubjectEditDialog(ctxt, subjectName, index, model);
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Expanded(
            child: new RaisedButton(
                child: Text(teacherName),
                onPressed: () {
                  SubjectEdit.createProfessorEditDialog(ctxt, teacherName, index, model);
                }),
          ),
          Expanded(
            child: new IconButton(
              padding: EdgeInsets.only(bottom: 1.0),
              icon: new Icon(
                Icons.delete,
                color: Colors.black,
                size: 44.0,
              ),
              onPressed: () {
                AppDB.delete("subject", "id", id); //Needs doing
                list.removeAt(index);
                Navigator.of(ctxt).pop();
                Navigator.of(ctxt).push(new MaterialPageRoute(builder: (BuildContext context)=> SubjectsPage("")));
              },
            ),
          ),
        ],
      ),
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