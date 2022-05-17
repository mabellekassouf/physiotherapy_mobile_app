import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class TimerToStart extends StatefulWidget {
  @override
  _TimerToStartState createState() => _TimerToStartState();
}

class _TimerToStartState extends State<TimerToStart> {


  int _counter = 3;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartTimer();
  }

  StartTimer(){
    _counter = 3;
    if(_timer!=null){
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>1){
          _counter--;
        }else
          {
            _timer.cancel();
          //  Navigator.of(context).push(MaterialPageRoute(
          //    builder: (context) => WorkoutVideoScreen(),
          //  ));
            Navigator.of(context).popAndPushNamed("/workoutstart");
          }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
Text("Get Ready!",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40,color: Constants.darkAccent),),
      Container(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_counter',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40,color: Constants.lightAccent),),
        ],
      )
    ],
  ),
),
    );
  }

}
