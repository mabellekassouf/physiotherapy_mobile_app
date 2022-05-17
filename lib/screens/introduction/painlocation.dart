import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/other_pain_location.dart';
import 'package:waterbear_movement/screens/introduction/painrate.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class PainLocationScreen extends StatefulWidget {
  final String prevnav;
  PainLocationScreen(this.prevnav);
  @override
  _PainLocationScreenState createState() => _PainLocationScreenState();
}

class _PainLocationScreenState extends State<PainLocationScreen> {
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
                        Text("Where does it hurt\nthe most?",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                        Container(height: 30),
                        PainLocationChoice("Head"),
                        Container(height: 10),
                        PainLocationChoice("Neck"),
                        Container(height: 10),
                        PainLocationChoice("Shoulders"),
                        Container(height: 10),
                        PainLocationChoice("Chest"),
                        Container(height: 10),
                        PainLocationChoice("Pelvic"),
                        Container(height: 10),
                        PainLocationChoice("Arms"),
                        Container(height: 10),
                        PainLocationChoice("Back"),
                        Container(height: 10),
                        PainLocationChoice("Legs"),
                        Container(height: 10),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text("Other",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Constants.lightAccent)),
                                  onPressed: (){
                                    if(tempprevnav=="Summary")
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OtherPainLocationScreen("Summary")));
                                    else
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OtherPainLocationScreen("Introduction")));
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

  PainLocationChoice(String choice){
    return  Container(
      //height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constants.darkAccent,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            TextButton(child: Text(choice,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 14,color: Constants.lightAccent)),
                onPressed: (){
                  SaveAndNext(choice);
                }
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded,color: Constants.lightAccent,size: 20,),
              onPressed: (){
                SaveAndNext(choice);
              },
            ),
          ]
      ),
    );
  }

  SaveAndNext(String painlocation)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("PainLocation", painlocation);
      if(tempprevnav=="Summary")
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PainRateScreen("Summary")));
      else
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PainRateScreen("Introduction")));
    });

  }
}
