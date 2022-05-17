import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/screens/authentication/reset_sent.dart';
import 'package:waterbear_movement/screens/drawer/settings.dart';
import 'package:waterbear_movement/utilities/constants.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText1 = false;
  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  bool _obscureText2 = false;
  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }




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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios_rounded),
                            color: Constants.lightAccent,
                            iconSize: 25.0,
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SettingsPage()));
                            }),
                        Container(width: 30),
                        Text("Change Password",style: TextStyle(color: Constants.darkAccent,fontWeight: FontWeight.w900,fontSize: 20),),
                      ],
                    ),
                    Container(height: 10,),
                    Form(
                      key: _formKey,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Enter old password to reset password",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12),),
                            Container(height: 30),
                            Container(
                              height: 50,
                              child: TextFormField(
                                controller: oldpassword,
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
                                  hintText: "Old Password",
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
                                    return 'Please Enter Old Password';
                                  }
                                  return null;
                                },

                              ),
                            ),
                            Container(height: 10),
                            Container(
                              height: 50,
                              child: TextFormField(
                                controller: newpassword,
                                obscureText: _obscureText1,
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
                                  hintText: "New Password",
                                  hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
                                  suffixIcon: new IconButton(
                                      iconSize: 20,
                                      onPressed: _toggle1,
                                      icon: new Icon(_obscureText1 ? Icons.visibility_off_sharp : Icons.visibility_sharp,color: Colors.black26)),
                                ),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Constants.darkAccent
                                ),
                                validator: (String value){
                                  if(value.isEmpty)
                                  {
                                    return 'Please Enter New Password';
                                  }
                                  return null;
                                },

                              ),
                            ),
                            Container(height: 10),
                            Container(
                              height: 50,
                              child: TextFormField(
                                focusNode: _focus,
                                controller: confirmPassword,
                                obscureText: _obscureText2,
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
                                      onPressed: _toggle2,
                                      icon: new Icon(_obscureText2 ? Icons.visibility_off_sharp : Icons.visibility_sharp,color: Colors.black26)),
                                ),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Constants.darkAccent
                                ),
                                validator: (String value){
                                  if(value.isEmpty)
                                  {
                                    return 'Please re-enter confirm password';
                                  }
                                  if(newpassword.text!=confirmPassword.text){
                                    return "Passwords do not match";
                                  }

                                  return null;
                                },

                              ),
                            ),
                            Container(height: 10),
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Forgot password? ", style: TextStyle(color: Colors.grey,fontSize: 11.0,fontWeight: FontWeight.w700),),
                                        Container(
                                          width: 30,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ResetSentPasswordPage()));
                                            },
                                            child: Text("Reset", style: TextStyle(color: Colors.grey, fontSize: 11.0,fontWeight: FontWeight.w700, decoration: TextDecoration.underline),),
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                alignment: Alignment.centerLeft
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            ),
                            Container(height: 160),
                            Container(
                              width: MediaQuery.of(context).size.width/3.5,
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
                                    if(_formKey.currentState.validate())
                                    {
                                      print("Successfull");
                                      return;
                                    }else{
                                      print("UnSuccessfull");
                                    }
                                    //SaveAndNext(counter.toString());
                                  },
                                  child: Text("Change",style: TextStyle(color: Constants.lightAccent))
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
