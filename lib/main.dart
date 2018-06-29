import 'package:flutter/material.dart';
import 'components/first.dart';
import 'components/second.dart';
import 'components/third.dart';
import 'components/four.dart';
import 'components/httpget.dart';

void main() {
  runApp(new MaterialApp(
    // Title
      title: "导航",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("欢迎来到新世界"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab(),new FourTab(),new MyGetHttpData()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.account_box),
              text: "下一步",
            ),
            new Tab(
              icon: new Icon(Icons.description),
              text: "列表",
            ),
            new Tab(
              icon: new Icon(Icons.folder_shared),
              text: "输入功能",
            ),
            new Tab(
              icon: new Icon(Icons.account_balance),
              text: "日期选择",
            ),new Tab(
              icon: new Icon(Icons.vpn_lock),
              text: "网络请求",
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}