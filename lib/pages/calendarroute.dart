import 'package:flutter/material.dart';

class CalendarRoute extends StatelessWidget {
  final String pageText;
  CalendarRoute(this.pageText);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(pageText),),
      body: new Center(
        child: new Text(pageText),
      ),
    );
  }
}