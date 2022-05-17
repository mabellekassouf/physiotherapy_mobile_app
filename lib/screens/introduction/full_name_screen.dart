import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/country_screen.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class FullNameScreen extends StatefulWidget {
  @override
  _FullNameScreenState createState() => _FullNameScreenState();
}

class _FullNameScreenState extends State<FullNameScreen> {
  TextEditingController fullname = TextEditingController();
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
                      Text("Please enter your \nfull name",style: TextStyle(color: Constants.darkAccent,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            Container(height: 50),
            TextFormField(
              controller: fullname,
              keyboardType: TextInputType.text,
              focusNode: _focus,
              validator: (String value){
                if(value.isEmpty)
                {
                  return 'Please Enter Full Name';
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
                          SaveAndNext(fullname.text);
                        },
                        child: Text("Next",style: TextStyle(color: Constants.lightAccent))
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


  SaveAndNext(String fullName)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("FullName", fullName);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> CountryScreen()));
    });

  }
}
