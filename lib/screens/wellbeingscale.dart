import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class WellBeingScaleScreen extends StatefulWidget {
  @override
  _WellBeingScaleScreenState createState() => _WellBeingScaleScreenState();
}

class _WellBeingScaleScreenState extends State<WellBeingScaleScreen> {

  String slidervalue = "1";
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Well Being", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20,right: 20,top: 70,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text("On a scale from 1 to 5\nrate how you feel",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
Container(
  height: 90,
  child:   Column(
    children: [
          (_currentSliderValue==1) ? Padding(
              padding: const EdgeInsets.symmetric(horizontal:5.0),
              child: Text("Frustrated, want to be alone\nupset, frightened and feeling\nlike not talking to anyone?", style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.left,),
          ) : (_currentSliderValue==2)? Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text("Unhappy, worried, and want\nto talk to someone? Not at\nease and open to comfort?", style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.left,),
      ):(_currentSliderValue==3)?Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text("Calm but feeling dazed and\na little emotional?", style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.left,),
      ):(_currentSliderValue==4)?Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text("Good energy, focused,\nhappy and feeling good?", style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.left,),
      ):Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text("Brave, confident, flexible,\nand feeling motivated?", style: TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.left,),
      ),
    ],

  ),
),
              Text(slidervalue,style: TextStyle(color: Constants.darkAccent,fontSize: 40,fontWeight: FontWeight.w900),),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Constants.lightAccent,
                  activeTickMarkColor:  Constants.lightAccent,
                  inactiveTickMarkColor:  Constants.lightAccent,
                  activeTrackColor:  Constants.lightAccent,
                  thumbColor: Constants.lightAccent,
                  overlayColor: Colors.amberAccent.withOpacity(0.5),
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: _currentSliderValue,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double newValue) {
                    setState(() {
                      _currentSliderValue = newValue;
                      slidervalue = ""+newValue.toStringAsFixed(0);

                    });
                  },
                ),
              ),
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
                      SaveAndNext(_currentSliderValue);
                    },
                    child: Text("Save",style: TextStyle(color: Constants.lightAccent))
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
  SaveAndNext(double wellBeing)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    int realWellBeingnumber = wellBeing.toInt();
    String wellBeingText= "";
    if(realWellBeingnumber==1)
      {
        wellBeingText ="Frustrated & upset";

      }
    else if (realWellBeingnumber==2)
      {
        wellBeingText ="Unhappy & worried";
      }
    else if (realWellBeingnumber==3)
    {
      wellBeingText ="Calm but emotional";
    }
    else if (realWellBeingnumber==4)
    {
      wellBeingText ="Feeling good & focused";
    }
    else
      {
        wellBeingText ="Confident brave & motivated";
      }
    setState((){
      sharedpreferences.setString("wellBeingNumber", "$realWellBeingnumber");
      sharedpreferences.setString("wellBeing", "$wellBeingText");
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SummaryPage()));

    });
  }
}
