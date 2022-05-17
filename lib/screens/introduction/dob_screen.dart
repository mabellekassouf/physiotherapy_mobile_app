import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/height_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';


class DateOfBirthScreen extends StatefulWidget {
  @override
  _DateOfBirthScreenState createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  DateTime dateTime = DateTime.now();
  String dateDisplay = "";
  FocusNode _focus = new FocusNode();

  void _onFocusChange(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focus.addListener(_onFocusChange);
    dateDisplay = convertDateTimeDisplay(DateTime.now().toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child:Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 35,right:35,top: 5),
        child: Row(
          children: [
            SizedBox(
              height: 9,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0.0),
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.lightAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: (){},
                  child: Text("")
              ),
            ),
            Spacer(),
            SizedBox(
              height: 9,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0.0),
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.lightAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: (){},
                  child: Text("")
              ),
            ),
            Spacer(),
            SizedBox(
              height: 9,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0.0),
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.darkAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: (){},
                  child: Text("")
              ),
            ),
            Spacer(),
            SizedBox(
              height: 9,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0.0),
                      backgroundColor: MaterialStateProperty.all<Color>(Constants.darkAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      )
                  ),
                  onPressed: (){},
                  child: Text("")
              ),
            ),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 60,right: 60,top: 70),
                      child: Column(
                        children: [
                          Text("To improve calculations\nenter your date of birth",style: TextStyle(color: Constants.darkAccent,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                          Container(height: 50),
                          TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: dateDisplay,
                                hintStyle: TextStyle(fontSize: 39,fontWeight: FontWeight.w700),
                                isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3.5,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Constants.darkAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                              )
                          ),
                          onPressed: (){
                            SaveAndNext(dateDisplay);
                          },
                          child: Text("Next",style: TextStyle(color: Constants.lightAccent))
                      ),
                    ),
                    Container(height: 20),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoDatePicker(
                          initialDateTime: dateTime,
                          minimumYear: 1920,
                          maximumYear: DateTime.now().year,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (dateTime){
                            setState(() {
                              this.dateTime = dateTime;
                              dateDisplay = convertDateTimeDisplay(dateTime.toString());
                            });
                          }
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    ],
  ),
    ),
    );
  }

  SaveAndNext(String dateofbirth)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Dateofbirth", dateofbirth);
      print(dateofbirth);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HeightScreen()));
    });

  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater =  DateFormat.yMMMd('en_US');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
}
