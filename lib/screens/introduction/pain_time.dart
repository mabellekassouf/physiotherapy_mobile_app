import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/screens/introduction/setting_up.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class PainTimeScreen extends StatefulWidget {
  final String prevnav;
  PainTimeScreen(this.prevnav);
  @override
  _PainTimeScreenState createState() => _PainTimeScreenState();
}

class _PainTimeScreenState extends State<PainTimeScreen> {
  String tempprevnav = "";
String painTimeChoice = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempprevnav = widget.prevnav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (tempprevnav=="Summary")? AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Pain", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ):null,
      body: SingleChildScrollView(
        child:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 70,right: 70,top: (tempprevnav=="Summary")?35:70,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("When does it hurt",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  Container(height: 30),
                  PainLocationChoice("Morning"),
                  Container(height: 20),
                  PainLocationChoice("Night"),
                  Container(height: 20),
                  PainLocationChoice("Occasionally"),
                  Container(height: 20),
                  PainLocationChoice("Always"),
                  (tempprevnav=="Summary")?Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: Container(
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
                            SaveAndNext(painTimeChoice);
                          },
                          child: Text("Save",style: TextStyle(color: Constants.lightAccent))
                      ),
                    ),
                  ):Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  PainLocationChoice(String choice){
    return  Container(
      //height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: (painTimeChoice==choice)?Constants.lightAccent:Constants.darkAccent,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (tempprevnav=="Summary")?Container():Spacer(),
            (tempprevnav=="Summary")?Container():Spacer(),
            TextButton(child: Text(choice,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14,color: (painTimeChoice==choice)?Constants.darkAccent:Constants.lightAccent)),
                onPressed: (){
              if(tempprevnav=="Summary"){
                setState(() {
                  painTimeChoice = choice;
                });
              }
              else{
                SaveAndNext(choice);
              }

                }
            ),
            (tempprevnav=="Summary")?Container():Spacer(),
            (tempprevnav=="Summary")?Container():IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20,),
              onPressed: (){
                if(tempprevnav=="Summary"){
                  setState(() {
                    painTimeChoice = choice;
                  });
                }
                else{
                  SaveAndNext(choice);
                }

              },
            ),
          ]
      ),
    );
  }

  SaveAndNext(String painTime)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("PainTime", painTime);
      if(tempprevnav=="Summary")
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SummaryPage()));
      else
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SettingUpScreen()));
    });

  }

}
