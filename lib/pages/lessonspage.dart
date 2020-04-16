import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/days/monday.dart';
import 'package:schoolboy3000/pages/days/tuesday.dart';
import 'package:schoolboy3000/pages/days/thursday.dart';
import 'package:schoolboy3000/pages/days/wednesday.dart';
import 'package:schoolboy3000/pages/days/friday.dart';
import 'package:schoolboy3000/pages/days/saturday.dart';
import 'package:schoolboy3000/pages/days/sunday.dart';


class LessonsPage extends StatelessWidget {
  final String pageText;
  LessonsPage(this.pageText);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("Choose a day to edit", style: new TextStyle(fontSize: 20.0),),
            SizedBox(height: 10,),
            Container(
                width: 300,
                height: 60,
                //padding: const EdgeInsets.all(5),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Monday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Monday("Monday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Tuesday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Tuesday("Tuesday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Wednesday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Wednesday("Wednesday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Thursday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Thursday("Thursday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Friday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Friday("Friday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Saturday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Saturday("Saturday")));
                  },
                )
            ),
            Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Sunday', style: TextStyle(fontSize: 20)),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Sunday("Sunday")));
                  },
                )
            ),
            /*ButtonWidget(title: "Monday",),
            ButtonWidget(title: "Tuesday",),
            ButtonWidget(title: "Wednesday",),
            ButtonWidget(title: "Thursday",),
            ButtonWidget(title: "Friday",),
            ButtonWidget(title: "Saturday",),
            ButtonWidget(title: "Sunday",)*/
          ],
        ),
      )
    );
  }
}