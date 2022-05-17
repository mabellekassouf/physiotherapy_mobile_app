import 'package:flutter/material.dart';
import 'package:waterbear_movement/screens/exercise/exercises.dart';
import 'package:waterbear_movement/utilities/constants.dart';

class EndOfWorkoutScreen extends StatefulWidget {
  @override
  _EndOfWorkoutScreenState createState() => _EndOfWorkoutScreenState();
}

class _EndOfWorkoutScreenState extends State<EndOfWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),Spacer(),
            Text("Finished for\nthe day!",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
            Spacer(),
            Spacer(),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width/3,
              padding: EdgeInsets.only(top:70),
              child:
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.darkAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                      )
                  ),
                  onPressed: (){
                    Navigator.of(context).popAndPushNamed("/Exercises");
                  },
                  child: Text("Done",style: TextStyle(color: Constants.lightAccent))
              ),
            ),
            Spacer(),
            Spacer(),
          ]
        ),
      ),
    );
  }
}
