import 'package:flutter/material.dart';
import 'DatePicker.dart';


class FourTab extends StatefulWidget {
  FourTab({Key key}) : super(key : key);

  @override
  _FourTabSate createState() => new _FourTabSate();

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: Colors.green,
//      body: new Container(
//        child: new Center(
//          child: new Column(
//            // center the children
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Icon(
//                Icons.account_balance,
//                size: 160.0,
//                color: Colors.white,
//              ),
//              new Text(
//                "Four Tab",
//                style: new TextStyle(color: Colors.white),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}

class _FourTabSate extends State<FourTab> {
  String _datetime = '';
  void _showDatePicker(){
    DatePicker.showDatePicker(
      context,
      showTitleActions: false,
      minYear: 1970,
      maxYear: 2020,
      initialYear: 2018,
      initialMonth: 6,
      initialDate: 28,
      onChanged: (year, month, date) {
        print('onChanged date: $year-$month-$date');
      },
      onConfirm: (year, month, date) {
        setState(() {
          _datetime = '$year-$month-$date';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("date picker"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Selecctd Date:',style: Theme.of(context).textTheme.subhead,
            ),
            new Text(
              '$_datetime',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'DatePicker',
        child: new Icon(Icons.date_range),
      ),
    );
  }
}