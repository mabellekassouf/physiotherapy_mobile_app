import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/weight_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  String heightDisplay="";
  FocusNode _focus = new FocusNode();

  void _onFocusChange(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focus.addListener(_onFocusChange);
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
                            Text("Enter your height\nestimate",style: TextStyle(color: Constants.darkAccent,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                            Container(height: 50),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: TextFormField(
                                    focusNode: _focus,
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        color: Constants.darkAccent
                                    ),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: heightDisplay,
                                      hintStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                                Text("cm",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 30),),
                              ],
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
                             SaveAndNext(heightDisplay);
                            },
                            child: Text("Next",style: TextStyle(color: Constants.lightAccent))
                        ),
                      ),
                      Container(height: 240),
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

  SaveAndNext(String heightvalue)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Height", heightvalue);
      print(heightvalue);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> WeightScreen()));
    });

  }
}
