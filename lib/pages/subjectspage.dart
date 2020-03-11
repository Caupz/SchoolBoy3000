import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  final String pageText;
  SubjectsPage(this.pageText);
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