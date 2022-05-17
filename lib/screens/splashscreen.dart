import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/screens/introduction/welcome_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimeout() {
    return  Timer(Duration(seconds: 4), changeScreen);
  }
//
  changeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context){
          return WelcomeScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            Container(height: 70),
            Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Constants.lightAccent),
                ),
              ),
            )
          ],
        ),
        //  ),
      ),
    );
  }


}
