import 'package:flutter/material.dart';
import 'package:schoolboy3000/widgets/buttonWidget.dart';

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
            ButtonWidget(title: "Monday",),
            ButtonWidget(title: "Tuesday",),
            ButtonWidget(title: "Wednesday",),
            ButtonWidget(title: "Thursday",),
            ButtonWidget(title: "Friday",),
            ButtonWidget(title: "Saturday",),
            ButtonWidget(title: "Sunday",)
          ],
        ),
      )
    );
  }
}