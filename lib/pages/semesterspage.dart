import 'package:flutter/material.dart';
import 'package:schoolboy3000/Routes/semestersroute.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';
import 'package:schoolboy3000/models/semester.dart';
import 'package:schoolboy3000/pages/semesteredit.dart';


class SemestersPage extends StatelessWidget {
  final String pageText;
  SemestersPage(this.pageText);

  Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    List<Semester> list = model.semesters;

    int id = list[index].id;
    String semesterName = list[index].semesterName;
    int semesterOrder = list[index].semesterOrder;
    String semesterSeason = list[index].semesterSeason;

    return new Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: new RaisedButton(
                child: Text(semesterName),
                onPressed: () {
                  SemesterEdit.createSemesterNameEditDialog(ctxt, semesterName, id, model);
                  // TODO minna vastava variable id ehk list[index].id semester muutmisse.
                }),
          ),
          Expanded(
            child: new RaisedButton(
                child: Text(semesterOrder.toString()),
                onPressed: () {
                  SemesterEdit.createSemesterOrderEditDialog(ctxt, semesterOrder, id, model);
                  // TODO minna vastava variable id ehk list[index].id semester muutmisse.
                }),
          ),
          Expanded(
            child: new RaisedButton(
                child: Text(semesterSeason),
                onPressed: () {
                  SemesterEdit.createSemesterSeasonEditDialog(ctxt, semesterSeason, id, model);
                  // TODO minna vastava variable id ehk list[index].id semester muutmisse.
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
                AppDB.delete("semester", "id", id);
                list.removeAt(index);
                Navigator.of(ctxt).pop();
                Navigator.of(ctxt).push(new MaterialPageRoute(builder: (BuildContext context)=> SemestersPage("")));
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
                      child: Text('Add a new semester', style: TextStyle(fontSize: 20)),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SemestersRoute("Semesters route")));
                      },
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text('All semesters:', style: TextStyle(fontSize: 20))
                ),
                new ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.semesters.length,
                    itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index, model)
                )
              ])
          );
        });
  }
}