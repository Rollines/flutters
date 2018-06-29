import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyGetHttpData extends StatefulWidget{
  @override
  MyGetHttpDataState createState() => new MyGetHttpDataState();
    // TODO: implement createState
  }

class MyGetHttpDataState extends State<MyGetHttpData>{

    final String url = "https://swapi.co/api/planets/";
    List data;

    Future<String> getJSONData() async{
      var response  = await http.get(
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"}
      );
      print(response.body);

      setState(() {
        var dataConvertedToJSON = JSON.decode(response.body);
        data = dataConvertedToJSON['results'];
      });
      return "Successfull";
    }
  @override
  Widget build(BuildContext context) {
    var url = "http://192.168.40.8:8080/ajaxValidation.do";
    http.post(url, body: {"username": "admin", "password":'1',"company":"1","checkCode":"1233"})
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("获取接口"),
      ),
      body: new ListView.builder(
        itemCount: data == null?0:data.length,
        itemBuilder: (BuildContext context,int index){
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        data[index]['name'],
                        style: new TextStyle(
                          fontSize: 20.0,color: Colors.lightBlueAccent
                        ),
                      ),
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )),
          );
        }),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJSONData();
  }
}
