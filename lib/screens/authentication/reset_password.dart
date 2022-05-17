import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/screens/authentication/reset_sent.dart';
import 'package:waterbear_movement/screens/drawer/settings.dart';
import 'package:waterbear_movement/utilities/constants.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();



  bool _obscureText = false;
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
                      Column(
                        children: [
                          Container(height: 3),
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded),
                              color: Constants.lightAccent,
                              iconSize: 25.0,
                              onPressed: (){
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                      Container(width: 30),
                      Text("Reset Password",style: TextStyle(color: Constants.darkAccent,fontWeight: FontWeight.w900,fontSize: 20),),
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
                          Text("Enter Email in order to reset password",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12),),
                          Container(height: 60),
                          Container(
                            height: 50,
                            child: TextFormField(
                              controller: email,
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
                                return null;
                              },

                            ),
                          ),

                          Container(height: 220),
                          Container(
                            width: MediaQuery.of(context).size.width/3,
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
                                  //SaveAndNext(counter.toString());
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ResetSentPasswordPage()));
                                },
                                child: Text("Reset",style: TextStyle(color: Constants.lightAccent))
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
