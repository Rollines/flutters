import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: Colors.red,
//      body: new Container(
//        child: new Center(
//          child: new Column(
//            // center the children
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Icon(
//                Icons.account_box,
//                size: 160.0,
//                color: Colors.white,
//              ),
//              new Text(
//                "First Tab",
//                style: new TextStyle(color: Colors.white),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
@override
  FirstTabState createState() => new FirstTabState();
}

class FirstTabState extends State<FirstTab> {

    int current_step=0;
    List<Step> my_steps=[
      new Step(
          title: new Text("step 1"), 
          content: new Text("hello!"),
        isActive: true
      ),
      new Step(
          title: new Text("step 2"),
          content: new Text("world!"),
          state: StepState.editing,
          isActive: true
      ),
      new Step(
          title: new Text("step 3"),
          content: new Text("hello world!"),
          isActive: true
      ),
    ];

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        // Appbar
        appBar: new AppBar(
          // Title
          title: new Text("Simple Material App"),
        ),
        // Body
        body: new Container(
            child: new Stepper(
              // Using a variable here for handling the currentStep
              currentStep: this.current_step,
              // List the steps you would like to have
              steps: my_steps,
              type: StepperType.vertical,
              onStepTapped: (step) {
                setState(() {
                  // jump to the tapped step
                  current_step = step;
                });
                // Log function call
                print("onStepTapped : " + step.toString());
              },
              onStepCancel: () {
                setState(() {
                  // update the variable handling the current step value
                  if (current_step > 0) {
                    current_step = current_step - 1;
                  } else {
                    current_step = 0;
                  }
                });
                // Log function call
                print("onStepCancel : " + current_step.toString());
              },
              onStepContinue: () {
                setState(() {
                  // going back one step i.e adding 1, until its the length of the step
                  if (current_step < my_steps.length - 1) {
                    current_step = current_step + 1;
                  } else {
                    current_step = 0;
                  }
                });
                // Log function call
                print("onStepContinue : " + current_step.toString());
              },
            )),
      );
    }
}
