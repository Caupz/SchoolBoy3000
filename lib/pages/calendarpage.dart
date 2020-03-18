import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final String pageText;
  CalendarPage(this.pageText);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),),
      body: new Center(
        child: new Text(pageText, style: new TextStyle(fontSize: 40.0),),
      ),
    );
  }
}