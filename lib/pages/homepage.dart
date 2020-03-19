import 'package:flutter/material.dart';
import 'package:schoolboy3000/widgets/drawerWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("SchoolBoy3000"), backgroundColor: Colors.blueAccent,),
      drawer: DrawerWidget(),
      body: new Center(
        child: new Text("See on avaleht", style: new TextStyle(fontSize: 40.0),),
      ),
    );
  }
}