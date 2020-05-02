import 'package:flutter/material.dart';
import 'package:schoolboy3000/models/mainmodel.dart';
import 'package:schoolboy3000/models/subjectentry.dart';
import 'package:schoolboy3000/widgets/drawerWidget.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

    void sortByDateAndDay(list){
      var sorter = {"Monday" : 1, "Tuesday" : 2, "Wednesday" : 3, "Thursday" : 4, "Friday" : 5, "Saturday" : 6, "Sunday" : 7};
      
      list.sort((a,b) => a.departureTime.toString().compareTo(b.departureTime.toString()));
      list.sort((a,b)=> sorter[a.selectedDay].compareTo(sorter[b.selectedDay]));
    }

    Widget buildBody(BuildContext ctxt, int index, MainModel model) {
    List<SubjectEntry> list = model.subjectEntries;
    sortByDateAndDay(list);

    String day = list[index].selectedDay;
    String subject = list[index].subject;
    String transportType = list[index].transportType;
    String departureTime = list[index].departureTime;

    return new Container(
    margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
    child: new Column(
      children: <Widget>[
        Container(
              child: Text(day ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Container(
              child: Text(subject),
        ),
        Container(
              child: Text("Tuleb väljuda " + departureTime),
        ),
        Container(
              child: Text("Transpordi tüüp " + transportType),
        ),
      ],
    ),
  );
  
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return new Scaffold(
            appBar: AppBar(title: new Text("SchoolBoy3000"), backgroundColor: Colors.blueAccent,),
            drawer: DrawerWidget(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.subjectEntries.length,
                    itemBuilder: (BuildContext ctxt, int index) => buildBody(ctxt, index, model)
                )
              ],
            )
          );
        }
        );
  }
}