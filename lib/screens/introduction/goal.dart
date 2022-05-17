import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/screens/introduction/gender_screen.dart';
import 'package:waterbear_movement/screens/introduction/other_goals.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class GoalScreen extends StatefulWidget {
  final String prevnav;
  GoalScreen(this.prevnav);
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {

  String tempprevnav = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempprevnav = widget.prevnav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: (tempprevnav=="SummaryScreen")? AppBar(
         leading: IconButton(
           onPressed: (){
             Navigator.pop(context);
           },
           icon: Icon(Icons.arrow_back_ios_rounded),
         ),
          elevation: 0,
          backgroundColor: Constants.darkAccent,
          title: Text("Goal", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
          iconTheme: IconThemeData(color: Constants.lightAccent),
        ):null,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 70,right: 70,top: 70,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Choose your goal",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
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
                          Spacer(),
                           TextButton(child: Text("Become pain free",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                           onPressed: (){
                             SaveAndNext("Become pain free");
                           },

                           ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20,),
                            onPressed: (){
                              SaveAndNext("Become pain free");
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
                          Spacer(),
                          TextButton(child: Text("Stay in shape",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                          onPressed: (){
                            SaveAndNext("Stay in shape");
                          },

                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20,),
                            onPressed: (){
                              SaveAndNext("Stay in shape");
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
                          Spacer(),
                              TextButton(child: Text("Lose weight",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                              onPressed: (){
                                SaveAndNext("Lose weight");
                              },
                              ),
                          Spacer(),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20),
                                onPressed: (){
                                  SaveAndNext("Lose weight");
                                },
                              ),
                        ]
                    ),
                  ),

                  Container(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Text("Other",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                            onPressed: (){
                              if(tempprevnav=="CountryScreen"){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OtherGoalsScreen("CountryScreen")));
                              }
                              else
                              {
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OtherGoalsScreen("SummaryScreen")));
                              }
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
      ),
    );
  }

  SaveAndNext(String goals)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Goal", goals);
      if(tempprevnav=="CountryScreen"){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> GenderScreen()));
      }
      else
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SummaryPage()));
        }

    });

  }

}
