import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/pain_time.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class PainRateScreen extends StatefulWidget {
  final String prevnav;
  PainRateScreen(this.prevnav);
  @override
  _PainRateScreenState createState() => _PainRateScreenState();
}

class _PainRateScreenState extends State<PainRateScreen> {

  String tempprevnav = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempprevnav = widget.prevnav;
  }
  double _currentSliderValue = 0;
  String slidervalue = "0";


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
          padding: EdgeInsets.only(left: 20,right: 20,top: (tempprevnav=="Summary")?35:70,bottom: (tempprevnav=="Summary")?150:100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
                  Text("On a scale from 0 to 10\nrate your pain",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  Text(slidervalue,style: TextStyle(color: Constants.darkAccent,fontSize: 40,fontWeight: FontWeight.w900),),
                  Column(
                    children: [
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
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              _currentSliderValue = newValue;
                              slidervalue = ""+newValue.toStringAsFixed(0);

                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("No Pain",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 12)),
                            Text("Extreme Pain",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),

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
                          SaveAndNext(_currentSliderValue);
                        },
                        child: Text("Next",style: TextStyle(color: Constants.lightAccent))
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  SaveAndNext(double rate)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
   int realRate = rate.toInt();
    setState((){
      sharedpreferences.setString("painRate", "$realRate");
      if(tempprevnav=="Summary")
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PainTimeScreen("Summary")));
      else
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PainTimeScreen("Introduction")));
    });
  }

}
