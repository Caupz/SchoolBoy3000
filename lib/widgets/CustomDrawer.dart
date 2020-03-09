import 'package:flutter/material.dart';
import 'package:templates/main.dart';

class CustomDrawer extends StatelessWidget{
    Widget build(BuildContext context){
      return Drawer(
        child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: 
                      Row(children: <Widget>[
                        Icon(Icons.calendar_today, size: 25,),
                        SizedBox(width: 5,),
                        Text("Calendar", style: TextStyle(fontSize: 20))
                    ],),),
                  ),
                SizedBox(width: 140,),
                GestureDetector(
                  child: Icon(Icons.menu, size: 30),
                  onTap: () => {
                      Navigator.pop(context)
                  },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: 
                  Row(children: <Widget>[
                    Icon(Icons.library_books, size: 25,),
                    SizedBox(width: 5,),
                    Text("Subjects", style: TextStyle(fontSize: 20) )
                ],),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: 
                  Row(children: <Widget>[
                    Icon(Icons.table_chart, size: 25,),
                    SizedBox(width: 5,),
                    Text("Lesson plan", style: TextStyle(fontSize: 20))
                ],),),
              ),
              SizedBox(height: 460,),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: 
                      Row(children: <Widget>[
                        Icon(Icons.settings, size: 50,),
                        SizedBox(width: 5,),
                        Text("Settings", style: TextStyle(fontSize: 20))
                    ],),),
                  ),
                  SizedBox(width: 80,),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: 
                      Row(children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.home, size: 50,),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: 
                            (context) => MyHomePage()))    
                        },
                      ),
                    ]
                    ,)
                    ),
                ),
                ],
              ),

          ],)
      );
    }

}