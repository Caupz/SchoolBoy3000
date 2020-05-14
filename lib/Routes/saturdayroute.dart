import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/mainmodel.dart';

class SaturdayRoute extends StatefulWidget{
  final String title;
  SaturdayRoute({Key key, @required this.title}) : super(key : key);

  @override
  _SaturdayRouteState createState() => _SaturdayRouteState();
}


class _SaturdayRouteState extends State<SaturdayRoute>{
  String dropdownSubject = "Teoreetiline informaatika";
  String dropdownDay = "Saturday";
  String selectedDay = "Saturday";
  String subject = "Teoreetiline informaatika";
  String startTime = "";
  String endTime = "";
  String room = "NO-ROOM";
  String transportType = "NO-TRANSPORT";
  String departureTime = "";
  String _time = "Not set";


  TextEditingController _controller;


  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: "");

  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return new Scaffold(
            appBar: new AppBar(title: new Text(widget.title),),
            body: Column(children: <Widget>[
              Container(
                  color: Colors.white,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.all(25.0),
                  child: new Text("Fill in your lesson plan for saturday",
                    style: new TextStyle(fontSize: 20.0),)
              ),
              // päeva valik ka siin olemas, sest hardcodeme
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: DropdownButton<String>(
                    value: dropdownDay,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.blueAccent
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String newValue) {
                      selectedDay = newValue;
                    },
                    items: <String>[
                      'Monday', 'Tuesday', 'Thursday', 'Wednesday', 'Friday', 'Saturday', 'Sunday'
                    ] // TODO dropdown saab subjectid db-st mis on lisatud subject pagelt
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                ),
              ),
              // aine valimine
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: DropdownButton<String>(
                    value: dropdownSubject,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.blueAccent
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String newValue) {
                      subject = newValue;
                    },
                    items: <String>[
                      'Teoreetiline informaatika',
                      'Tõenäosus teooria elemendid',
                      'Teaduslik mõtteviis'
                    ] // TODO dropdown saab subjectid db-st mis on lisatud subject pagelt
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                ),
              ),
              // ruumi lisamine
              Container(
                  padding: EdgeInsets.fromLTRB(175, 0, 25, 0),
                  child: TextField(
                    onChanged: (String newValue) {
                      room = newValue;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Room'
                    ),
                  )
              ),
              // tunni algusaja valimine
              Container(
                  child: new FlatButton(
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 300.0,
                            ),
                            showTitleActions: true,
                            onConfirm: (time) {
                              debugPrint('confirm $time');
                              _time = '${time.hour} - ${time.minute}';
                              startTime = _time;
                            },
                            currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text('Choose the starting time',)
                  )
              ),
              // tunni lõpuaja valimine
              Container(
                  child: new FlatButton(
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            onConfirm: (time) {
                              debugPrint('confirm $time');
                              print(endTime);
                              _time = '${time.hour} - ${time.minute}';
                              endTime = _time;

                            },
                            currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text('Choose the ending time',)
                  )
              ),
              RaisedButton(
                color: Color(0xff0091EA),
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text("Transport"),
                onPressed: (){
                  showDialog(context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.fromLTRB(60, 0, 25, 0),
                                      child: TextField(
                                        onChanged: (String newValue) {
                                          transportType = newValue;
                                        },
                                        controller: _controller,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Transpordi tüüp"
                                        ),
                                      )
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        DatePicker.showTimePicker(context,
                                            theme: DatePickerTheme(
                                              containerHeight: 210.0,
                                            ),
                                            showTitleActions: true,
                                            onConfirm: (time) {
                                              debugPrint('confirm $time');
                                              print(departureTime);
                                              _time = '${time.hour} - ${time.minute}';
                                              setState(() {
                                                departureTime = _time;
                                              });

                                            },
                                            currentTime: DateTime.now(), locale: LocaleType.en);
                                      },
                                      child: Text(departureTime == "" ? "Departure Time" : departureTime)
                                  ),
                                  ButtonTheme(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Close"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        );
                      }
                  );
                },
              ),
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 50,
                  child: RaisedButton(
                    padding: EdgeInsets.all(13.0),
                    child: Text('Add subject to saturday plan',
                        style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      //tahad tagasi minna siis pop enne data savemist, muidu ei tööta
                      Navigator.of(context).pop();
                      model.addSubjectEntry(-1, selectedDay, subject, startTime, endTime, room,transportType,departureTime, true, true);
                      //model.addSubjectEntry(1, "Saturday", subject, startTime, endTime, room, transportType, departureTime, true, true);
                      // Navigator.of(context).push(new MaterialPageRoute(
                      // builder: (BuildContext context) => new Saturday("Saturday")),);
                    },
                  )
              ),
            ]),
          );
        }
    );
  }
}