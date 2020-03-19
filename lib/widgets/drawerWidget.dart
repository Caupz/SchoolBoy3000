import 'package:flutter/material.dart';
import 'package:schoolboy3000/pages/calendarpage.dart';
import 'package:schoolboy3000/pages/homepage.dart';
import 'package:schoolboy3000/pages/lessonspage.dart';
import 'package:schoolboy3000/pages/settings.dart';
import 'package:schoolboy3000/pages/subjectspage.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("Calendar", style: new TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.calendar_today),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> CalendarPage("Calendar page")));
              },
            ),
            new ListTile(
              title: new Text("Subjects", style: new TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.school),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SubjectsPage("Subjects page")));
              },
            ),
            new ListTile(
              title: new Text("Lesson plan", style: new TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.date_range),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> LessonsPage("Lesson plan page ")));
              },
            ),
            new ListTile(
              title: new Text("Settings", style: new TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.settings),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> SettingsPage("Settings")));
              },
            ),
            new ListTile(
              title: new Text("Home", style: new TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.home),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> HomePage()));
              },
            ),
          ],
        ),
      );
  }
}