import 'package:flutter/material.dart';
import 'package:schoolboy3000/Routes/tuesdayroute.dart';
import 'package:schoolboy3000/utils/database.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/mainmodel.dart';
import 'package:schoolboy3000/models/subjectentry.dart';

class Tuesday extends StatelessWidget {
  final String pageText;
  Tuesday(this.pageText);

  Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    List<SubjectEntry> list = model.subjectEntries;

    int id = list[index].id; // TODO seda kasutada onPressed muutmisse minnes.
    String selected_day = list[index].selectedDay;
    String subject = list[index].subject;
    String start_time = list[index].startTime.toString();
    String end_time = list[index].endTime.toString();
    String room = list[index].room;

/*    //Et saaks Textina datetime formati näidata
    var formatter = new DateFormat('H:m');
    String formattedstartTime = formatter.format(start_time);
    String formattedendTime = formatter.format(end_time);*/

    return new Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: new Column(
        children: <Widget>[
          Container(
            child: new RaisedButton(
                child: Text(subject),
                onPressed: () {
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Container(
            child: new RaisedButton(
                child: Text(start_time),
                onPressed: () {
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Container(
            child: new RaisedButton(
                child: Text(end_time),
                onPressed: () {
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Container(
            child: new RaisedButton(
                child: Text(room),
                onPressed: () {
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),
          Container(
            child: new RaisedButton(
                child: Text('id on $id'),
                onPressed: () {
                  // id test
                }),
          ),
          Container(
            child: new IconButton(
              padding: EdgeInsets.only(bottom: 1.0),
              icon: new Icon(
                Icons.delete,
                color: Colors.black,
                size: 44.0,
              ),
              onPressed: () {
                AppDB.delete('subject_entry','id', id); //Needs doing
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
                        //Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> TuesdayRoute(title: "TuesdayRoute",)));
                      },
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text('All subjects on tuesday:', style: TextStyle(fontSize: 20))
                ),
                new ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.subjectEntries.length,
                    itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index, model)
                )
              ])
          );
        });
  }
}

// näitab valitud päeva
/*          Container(
            child: new RaisedButton(
                child: Text(selectedDay),
                onPressed: () {
                  // TODO minna vastava variable id ehk list[index].id subject muutmisse.
                }),
          ),*/