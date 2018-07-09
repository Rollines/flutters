import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedDemo extends StatefulWidget {
  SharedDemo({Key key,this.title}) : super(key:key);
  final String title;
  @override
  _SharedDemoState createState() => new _SharedDemoState();
}

class _SharedDemoState extends State<SharedDemo> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }
  void _loadCounter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _counter = (preferences.getInt('counter') ?? 0);
    });
  }
  //counter after click
_incrementCounter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = (preferences.getInt('counter') ?? 0)+1;
    setState(() {
      _counter;
    });
    preferences.setInt('counter', _counter);
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('My name is Doctor.chen!to sharedpreferences!',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
      ),
    );
  }
}
