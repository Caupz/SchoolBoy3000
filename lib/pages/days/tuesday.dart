import 'package:flutter/material.dart';

class Tuesday extends StatelessWidget {
  final String pageText;
  Tuesday(this.pageText);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),),
      body: new Center(
        child: new Text(pageText, style: new TextStyle(fontSize: 35.0),),
      ),
    );
  }
}