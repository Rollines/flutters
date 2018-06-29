import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  ThirdTab({Key key}):super(key:key);

  @override
  ThirdTabState createState() => new ThirdTabState();
}
class ThirdTabState extends State<ThirdTab> {
  final TextEditingController controller = new TextEditingController();
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
              new TextField(
                decoration: new InputDecoration(
                  helperText: 'your unique id.',
                  hintText: 'phone',
                  icon: new Icon(Icons.phone),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text('what you typed'),
                      content: new Text(controller.text),
                    ),
                  );
                },
                child: new Text('DONE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}