import 'package:flutter/material.dart';

class Sunday extends StatelessWidget {
  final String pageText;
  Sunday(this.pageText);
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