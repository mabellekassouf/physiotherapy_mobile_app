import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/screens/drawer/settings.dart';
import 'package:waterbear_movement/utilities/constants.dart';

class ResetSentPasswordPage extends StatefulWidget {
  @override
  _ResetSentPasswordPageState createState() => _ResetSentPasswordPageState();
}

class _ResetSentPasswordPageState extends State<ResetSentPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                          Container(height: 3),
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded),
                              color: Constants.lightAccent,
                              iconSize: 25.0,
                              onPressed: (){
                                Navigator.of(context).pop();
                              }),
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
                              Text("An Email has been sent to your account.\nPlease check your inbox for more details\non how to reset your password",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12),textAlign: TextAlign.center),


                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
