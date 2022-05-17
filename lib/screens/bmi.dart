import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/wellbeingscale.dart';
import 'package:waterbear_movement/utilities/bmi_measurements.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController _weight = new TextEditingController();
  TextEditingController _height = new TextEditingController();
  double _bmi = 0.0;

  //for weight choice
  int weightChoice=10;
  List weightListView= BMIMeasurements.ListWeight;

  //for height choice
  int heightChoice=50;
  List heightListView= BMIMeasurements.ListHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateBMI();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text("Enter \nweight and height",style: TextStyle(fontSize: 37.0,fontWeight: FontWeight.w800),)),
            ],
          ),
        ),
        Container(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text("Weight:",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                    Container(width: 18),
                DropdownButton(
                        hint: Text("00"),
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 35,
                        style: TextStyle(fontSize: 13,color: Colors.black),
                        value: weightChoice,
                        onChanged: (newvalue){
                          setState(() {
                            weightChoice=newvalue;
                            calculateBMI();
                          });
                        },
                        items: weightListView.map((valueitem){
                          return DropdownMenuItem(
                            child: Text(valueitem.toString()),
                            value: valueitem,
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Text("Height:",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),
                    Container(width: 18),
                    DropdownButton(
                      hint: Text("00"),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 35,
                      style: TextStyle(fontSize: 13,color: Colors.black),
                      value: heightChoice,
                      onChanged: (newvalue){
                        setState(() {
                          heightChoice=newvalue;
                          calculateBMI();
                        });
                      },
                      items: heightListView.map((valueitem){
                        return DropdownMenuItem(
                          child: Text(valueitem.toString()),
                          value: valueitem,
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
         // Row(
         //   mainAxisAlignment: MainAxisAlignment.center,
         //   children: [
         //     RaisedButton(
         //        onPressed: () {
         //          calculateBMI();
         //        },
         //        color: Constants.darkPrimary,
         //        shape: RoundedRectangleBorder(
         //            borderRadius: BorderRadius.circular(25.0)
         //        ),
         //        child: Text("Calculate", style: TextStyle(
         //            color: Constants.lightPrimary, fontSize: 15.0),),
         //
         //      ),
         //   ],
         // ),

        Container(height: 20),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI:",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),),
              Container(width: 10),
              Text(_bmi.toStringAsFixed(2)),
            ],
          ),

        Container(height: 40),
        Text(getResult()),
        Text(getInterpretation()),
        Container(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (getInterpretation()=="Underweight")?Image(image: AssetImage('assets/images/BMI0black.png')):Image(image: AssetImage('assets/images/BMI0.png')),
            (getInterpretation()=="Normal")?Image(image: AssetImage('assets/images/BMI1black.png')):Image(image: AssetImage('assets/images/BMI1.png')),
            (getInterpretation()=="Overweight")?Image(image: AssetImage('assets/images/BMI2black.png')): Image(image: AssetImage('assets/images/BMI2.png')),
            (getInterpretation()=="Obese")?Image(image: AssetImage('assets/images/BMI3black.png')):Image(image: AssetImage('assets/images/BMI3.png')),
            (getInterpretation()=="Extremely Obese")?Image(image: AssetImage('assets/images/BMI4black.png')):Image(image: AssetImage('assets/images/BMI4.png')),
          ],
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50.0,
          margin: EdgeInsets.only(top: 65.0),
          padding: EdgeInsets.symmetric(horizontal: 70.0),
          child: RaisedButton(
            onPressed: () {
              SaveAndNext(_bmi);
            },
            color: Constants.darkPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            ),
            child: Text("Next", style: TextStyle(
                color: Constants.lightPrimary, fontSize: 25.0),),

          ),
        )
      ],
      ),
    )
    ),
    );
  }

   calculateBMI() {
    setState(() {
      _bmi = weightChoice / pow(heightChoice / 100, 2);
    });

  }

  String getInterpretation() {
    if (_bmi >= 35) {
      return 'Extremely Obese';
    } else if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResult() {
    if (_bmi >= 35) {
      return '35 <';
    } else if (_bmi >= 30) {
      return '30-34.9';
    } else if (_bmi >= 25) {
      return '25-29.9';
    } else if (_bmi >= 18.5) {
      return '18.5-24.9';
    } else {
      return '< 18.5';
    }
  }

  SaveAndNext(double bmi)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("BMI", "$bmi");
      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> WellBeingScaleScreen()));
    });
  }
}
