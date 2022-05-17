import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/authentication/reset_password.dart';
import 'package:waterbear_movement/screens/drawer/tips.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
        child: Container(
          height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(bottom:100),
            child: _isLoading ? Center(child: CircularProgressIndicator()): Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headerSection(),
                Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        textSection(),
                      ]
                  ),
                ),
                Container(),
                Container(),
                Container(),
                Container(),
                Column(
                  children: [
                    buttonSection(),
                    ResetPasswordSection(),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  Container headerSection(){
   return Container(
     padding: EdgeInsets.fromLTRB(35, 70, 35, 10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Text("Sign In",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
       ],
     ),
   );
  }
  Container textSection(){
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal:55.0),
      child: Column(
        children: <Widget>[
          txtEmail("Email"),
          SizedBox(height: 10.0),
          txtPassword("Password"),
        ],
      )
    );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Container txtEmail(String title){
    return Container(
      height: 50,
      child: TextFormField(
        controller: emailController,
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
          hintText: title,
          hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
        ),
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Constants.darkAccent
        ),
        validator: (String value){
          if(value.isEmpty || value == null)
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
    );
  }


  Container txtPassword(String title){
    return Container(
      height: 50,
      child: TextFormField(
        focusNode: _focus,
        controller: passwordController,
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
          hintText: title,
          hintStyle: TextStyle(fontSize: 12.0,color: Constants.lightAccent,fontWeight: FontWeight.w700),
          suffixIcon: new IconButton(
              iconSize: 20,
              onPressed: _toggle,
              icon: new Icon(_obscureText ? Icons.visibility_off_sharp : Icons.visibility_sharp,color: Colors.black26),
          ),
        ),
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Constants.darkAccent
        ),
        validator: (String value){
          if(value == null || value.isEmpty)
          {
            return 'Please Enter Password';
          }
          return null;
        },
      ),
    );
  }

  Container buttonSection(){
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
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
                setState(() {
                  _isLoading =  true;
                });
                // if (_formKey.currentState.validate()) {
                //   signIn(emailController.text, passwordController.text);
                // }  -> PERMANENT, to be placed when API exists
                tempSignIn();
              },
              child: Text("Sign in",style: TextStyle(color: Constants.lightAccent))
          ),

    );
  }


  Container ResetPasswordSection(){
    return Container(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ResetPasswordPage()));
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
    );
  }


  tempSignIn() async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.setString("Goal", "Lose Weight");
    sharedpreferences.setString("PainLocation", "Shoulders");
    sharedpreferences.setString("painRate", "5");
    // sharedpreferences.setString("wellBeing", "Confident brave & motivated");
    // sharedpreferences.setString("wellBeingNumber", "3");
    // sharedpreferences.setString("Water", "4");
    sharedpreferences.setString("CompletedExercises", "0");
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=> TipsPage()), (Route<dynamic> route) => false); // -> this is temporary, to be removed when API exists
  }


/*
  signIn(String email, String password) async {
    Map data = {
      'email': email,
      'password': password
    };
    var jsonData = null;
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    try {
      var response = await http.post(Uri.parse(""), body: data);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        setState(() {
          _isLoading = false;
          sharedpreferences.setString("token", jsonData['token']);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (BuildContext context) => TipsPage()), (
              Route<dynamic> route) => false);
        });
      }
      else {
        print(response.body);
      }
    }
    catch(e){
      print("Exception$e");
    }
  }*/
}
