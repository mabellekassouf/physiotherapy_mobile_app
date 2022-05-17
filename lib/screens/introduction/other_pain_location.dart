import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/painrate.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class OtherPainLocationScreen extends StatefulWidget {
  final String prevnav;
  OtherPainLocationScreen(this.prevnav);
  @override
  _OtherPainLocationScreenState createState() => _OtherPainLocationScreenState();
}

class _OtherPainLocationScreenState extends State<OtherPainLocationScreen> {

  String tempprevnav = "";


  TextEditingController painlocationchoice = new TextEditingController();
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
      appBar: (tempprevnav=="Summary")? AppBar(
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Pain", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
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
                  Text("Specify where does \nit hurt",style: TextStyle(color: Constants.darkAccent,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  Container(height: 50),
                  TextFormField(
                    controller: painlocationchoice,
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
                          SaveAndNext(painlocationchoice.text);
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


  SaveAndNext(String painlocation) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedpreferences.setString("PainLocation", painlocation);
      if(tempprevnav=="Summary")
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PainRateScreen("Summary")));
      else
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PainRateScreen("Introduction")));
    });
  }
}
