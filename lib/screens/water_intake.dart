import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
class WaterIntakeScreen extends StatefulWidget {
  @override
  _WaterIntakeScreenState createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Water Intake", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            Container(
              height:150,
            width:100,
            child:Image(
              fit: BoxFit.fill,
              height:270,
              width: MediaQuery.of(context).size.width,
              image: AssetImage('assets/water.png'),
            ),
      ),
            Spacer(),
            Spacer(),
            Text("How many cups did\nyou drink today?",textAlign: TextAlign.center,style: TextStyle(color: Constants.darkAccent,fontWeight: FontWeight.w700,fontSize: 20),),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.remove_rounded),
                    iconSize: 35,
                    color: Constants.darkAccent,
                    onPressed: (){
                  if(counter!=0) {
                    setState(() {
                      counter--;
                    });
                  }
                    }
                    ),
                Text(counter.toString(), style: TextStyle(color:Colors.grey, fontWeight: FontWeight.w700,fontSize: 25)),
                IconButton(
                    icon: Icon(Icons.add_rounded),
                    iconSize: 35,
                    color: Constants.lightAccent,
                    onPressed: (){
                  setState(() {
                    counter++;
                  });

                    }
                )
              ],
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width/2,
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
                    SaveAndNext(counter.toString());
                  },
                  child: Text("Save",style: TextStyle(color: Constants.lightAccent))
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  SaveAndNext(String water)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Water", water);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SummaryPage()));
    });

  }
}
