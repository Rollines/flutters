import 'package:flutter/material.dart';
import 'package:flutter_apptest/api/Api.dart';
import 'package:flutter_apptest/api/NetUtils.dart';

class SecondTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SecondTabPage();
  }
}

class SecondTabPage extends State<SecondTab>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,

      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.description,
                size: 160.0,
                color: Colors.white,
              ),
              new Text(
                "Second Tab",
                style: new TextStyle(color: Colors.white),
              ),

            ],
          ),
        ),
      ),
    );
  }
}