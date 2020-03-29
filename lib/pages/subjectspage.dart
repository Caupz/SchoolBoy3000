import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/subjectsroute.dart';
import 'package:schoolboy3000/utils/database.dart';

class SubjectsPage extends StatelessWidget {
  final String pageText;
  SubjectsPage(this.pageText);
  var subjects;

  void getSubjects() {
    debugPrint('SISESTATUD AINED:');
    var result = AppDB.select("subject", "", null);

    try {
      result.forEach((element) =>() {
        debugPrint('RESULT: $element');
      });
    } catch(NoSuchMethodError) {
      debugPrint('NO SUBJECTS');
    }
  }

  @override
  Widget build(BuildContext context) {
    getSubjects();

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
      ])
    );
  }
}