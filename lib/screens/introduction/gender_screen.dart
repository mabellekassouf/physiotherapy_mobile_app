import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/dob_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 70,right: 70,top: 70,bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Gender",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                        Container(height: 50),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Constants.darkAccent,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Spacer(),
                                TextButton(child: Text("Male",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                                  onPressed: (){
                                  SaveAndNext("Male");
                                  }
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20,),
                                  onPressed: (){
                                    SaveAndNext("Male");
                                  },
                                ),
                              ]
                          ),
                        ),
                        Container(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Constants.darkAccent,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Spacer(),
                                TextButton(child: Text("Female",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                                onPressed: (){
                                  SaveAndNext("Female");
                                },
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20),
                                  onPressed: (){
                                    SaveAndNext("Female");
                                  },
                                ),
                              ]
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
      ),
    );
  }

  SaveAndNext(String genderchoice)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Gender", genderchoice);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> DateOfBirthScreen()));
    });

  }
}
