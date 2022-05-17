import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/screens/introduction/gender_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class OtherGoalsScreen extends StatefulWidget {
  final String prevnav;
  OtherGoalsScreen(this.prevnav);
  @override
  _OtherGoalsScreenState createState() => _OtherGoalsScreenState();
}

class _OtherGoalsScreenState extends State<OtherGoalsScreen> {

  String tempprevnav = "";



  TextEditingController goal = new TextEditingController();
FocusNode _focus = new FocusNode();

void _onFocusChange(){
  SystemChrome.setEnabledSystemUIOverlays([]);
}

@override
void initState() {
    // TODO: implement initState
    super.initState();
    _focus.addListener(_onFocusChange);
    tempprevnav = widget.prevnav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (tempprevnav=="SummaryScreen")? AppBar(
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Other Goal", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ):null,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 80,right: 80,top: 70,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Please enter your \ngoal",style: TextStyle(color: Constants.darkAccent,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  Container(height: 50),
                  TextFormField(
                    controller: goal,
                    keyboardType: TextInputType.text,
                    focusNode: _focus,
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Goal';
                      }
                      return null;
                    },
                    onSaved: (String fname){

                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
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
                          SaveAndNext(goal.text);
                        },
                        child: Text("Continue",style: TextStyle(color: Constants.lightAccent))
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

  SaveAndNext(String goals) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState(() {
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