import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/drawer/tips.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:waterbear_movement/utilities/countries.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //TextController to read text entered in text field

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  DateTime _dateTime;

  //for uploading profile picture
  File _image;

  //for gender choice
  String genderChoice;
  List genderListView=[
    "male",
    "female"
  ];

  //for country choice
  String countryChoice;
  List countryListView= Countries.ListCountries;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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

  //terms and conditions
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 35,right:35,top: 70,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign up",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
              Center(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.text,
                            decoration:InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.lightAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.darkAccent,
                                  width: 1.0,
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(),
                              ),
                                hintText: "Email",
                              hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
                            ),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Constants.darkAccent
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Please Enter Email';
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                return 'Please a valid Email';
                              }
                              return null;
                            },
                            onSaved: (String email){

                            },
                          ),
                        ),
                        Container(height: 10),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.lightAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.darkAccent,
                                  width: 1.0,
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(),
                              ),
                                hintText: "Phone Number",
                              hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
                            ),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Constants.darkAccent
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Please Enter Phone Number ';
                              }
                              return null;
                            },
                            onSaved: (String phone){

                            },
                          ),
                        ),
                    //    Padding(
                    //      padding: const EdgeInsets.only(left: 50,top:20),
                    //      child: Row(
                    //        children: [
                    //          Expanded(child: Text( "DATE OF BIRTH",style: TextStyle(color: Colors.grey,fontSize: 12),)),
                    //        ],
                    //      ),
                    //    ),

                    //    Padding(
                    //      padding: const EdgeInsets.only(left: 50,right: 50),
                    //      child: TextFormField(
                    //        readOnly: true,
                    //        controller: DoB,
                    //        keyboardType: TextInputType.number,
                    //        decoration: InputDecoration(
                    //          hintText: _dateTime ==null? "yyyy-mm-dd":_dateTime.toString(),
                    //          hintStyle: TextStyle(fontSize: 12.0,color: Colors.grey),
                    //          suffixIcon: new IconButton(
                    //              onPressed: (){
                    //                showDatePicker(context: context,
                    //                    initialDate: DateTime.now(),
                    //                    firstDate: DateTime(1970),
                    //                    lastDate: DateTime(2222)
                    //                ).then((date) {
                    //                  setState(() {
                    //                    _dateTime = date;
                    //                    DoB.text = date.toString();
                    //                  });
                    //                });
                    //              },
                    //              icon: new Icon(Icons.calendar_today)),
                    //        ),
                    //        validator: (String value){
                    //          if(_dateTime.toString()==null)
                    //          {
                    //            return 'Please Enter Date of Birth ';
                    //          }
                    //          return null;
                    //        },
                    //        onSaved: (String dateOfBirth)//{

                    //        },
                    //        onTap: (){
                    //          showDatePicker(context: context,
                    //              initialDate: _dateTime == null?DateTime.now():_dateTime,
                    //              firstDate: DateTime(1970),
                    //              lastDate: DateTime(2222)
                    //          ).then((date) {
                    //            setState(() {
                    //              _dateTime = date;
                    //            });
                    //          });
                    //        },
                    //      ),
                    //    ),
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 50),
                    //     child: Row(
                    //       children: [
                    //          Text("GENDER:",style: TextStyle(color: Colors.grey,fontSize: 12),),
                    //         Container(width: 18),
                    //         DropdownButton(
                    //           hint: Text("Not Specified"),
                    //             icon: Icon(Icons.keyboard_arrow_down),
                    //             iconSize: 35,
                    //             style: TextStyle(fontSize: 13,color: Colors.black),
                    //             value: genderChoice,
                    //                  onChanged: (newvalue){
                    //                setState(() {
                    //                  genderChoice=newvalue;
                    //                });
                    //                  },
                    //            items: genderListView.map((valueitem){
                    //              return DropdownMenuItem(
                    //                  child: Text(valueitem),
                    //                value: valueitem,
                    //              );
                    //            }).toList(),
                    //          )
                    //        ],
                    //      ),
                    //    ),
                    //    Padding(
                    //      padding: const EdgeInsets.only(left: 50),
                    //      child: Row(
                    //        children: [
                    //          Text("COUNTRY:",style: TextStyle(color: Colors.grey,fontSize: 12),),
                    //          Container(width: 10),
                    //          DropdownButton(
                    //            hint: Text("Not Specified"),
                    //            icon: Icon(Icons.keyboard_arrow_down),
                    //            iconSize: 35,
                    //            style: TextStyle(fontSize: 13,color: Colors.black),
                    //            value: countryChoice,
                    //            onChanged: (newvalue){
                    //              setState(() {
                    //                countryChoice=newvalue;
                    //              });
                    //            },
                    //            items: countryListView.map((valueitem){
                    //              return DropdownMenuItem(
                    //                child: Text(valueitem),
                    //                value: valueitem,
                    //              );
                    //            }).toList(),
                    //          )
                    //        ],
                    //      ),
                    //    ),
                        Container(height: 10),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            controller: password,
                            obscureText: _obscureText,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.lightAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.darkAccent,
                                  width: 1.0,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
                              suffixIcon: new IconButton(
                                  iconSize: 20,
                                  onPressed: _toggle,
                                  icon: new Icon(_obscureText ? Icons.visibility_off_sharp : Icons.visibility_sharp,color: Colors.black26)),
                            ),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Constants.darkAccent
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Please Enter Password';
                              }
                              return null;
                            },

                          ),
                        ),
                        Container(height: 10),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            focusNode: _focus,
                            controller: confirmpassword,
                            obscureText: _obscureText,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.lightAccent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Constants.darkAccent,
                                  width: 1.0,
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(),
                              ),
                                hintText: "Confirm Password",
                              hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
                              suffixIcon: new IconButton(
                                  iconSize: 20,
                                  onPressed: _toggle,
                                  icon: new Icon(_obscureText ? Icons.visibility_off_sharp : Icons.visibility_sharp,color: Colors.black26)),
                            ),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Constants.darkAccent
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Please re-enter password';
                              }
                              if(password.text!=confirmpassword.text){
                                return "Password does not match";
                              }

                              return null;
                            },

                          ),
                        ),

                      ],
                    ),
                  ),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
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
                      if(_formkey.currentState.validate())
                      {
                        RegisterUser();
                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    child: Text("Sign up",style: TextStyle(color: Constants.lightAccent))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future RegisterUser() async{

    Map userdata = {
      'email':email.text,
      'phone':phone.text,
      'gender':genderChoice,
      'country':countryChoice,
      'password':password.text,
      'photo':_image
    };
try {
  //http.Response response = await http.post(Uri.parse(""), body: userdata);
  //var data = jsonDecode(response.body);
  //print("DATA: ${data}");
  SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
  setState(() {
   // sharedpreferences.setString("token", data['token']);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (BuildContext context) => TipsPage()), (
        Route<dynamic> route) => false);
  });
}
catch(e){
  print("Exception$e");
}
  }
}