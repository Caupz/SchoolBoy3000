import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String title;
  final String route;
  ButtonWidget({Key key, @required this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ButtonTheme(
        minWidth: 200,
        buttonColor: Colors.lightBlue,
        child: RaisedButton(
          child: Text(this.title),
          onPressed: (){
            showDialog(context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                            DropdownButton<String>(
                            isExpanded: true,
                            hint: Text("Eelnevalt lisatud"),
                            items: <String>['16.00-17.46 S404', '12.00-13.46 A503', '17.00-19.46 S202', '16.00-17.46 S302'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Beginning time"
                            ),
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: "Ending time"
                            ),
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                hintText: "Room"
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ButtonTheme(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                      child: Text("Add"),
                                      onPressed: (){},
                                  ),
                                    ),
                              ),
                              ButtonTheme(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                    child: Text("Save"),
                                    onPressed: (){},
                                ),
                                  ),
                          ),
                            ],
                          ),
                        ]
                  )
                  ),
              );
            }
            );
          },
      ),
    );
  }
}