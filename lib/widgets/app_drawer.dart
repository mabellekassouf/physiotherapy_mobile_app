import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/authentication/login.dart';
import 'package:waterbear_movement/screens/drawer/contactUs.dart';
import 'package:waterbear_movement/screens/drawer/medical_profile.dart';
import 'package:waterbear_movement/screens/drawer/meeting.dart';
import 'package:waterbear_movement/screens/drawer/settings.dart';
import 'package:waterbear_movement/screens/drawer/summary.dart';
import 'package:waterbear_movement/screens/drawer/tips.dart';
import 'package:waterbear_movement/screens/exercise/exercises.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class AppDrawer extends StatefulWidget {
  final String prevnav;
  AppDrawer(this.prevnav);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
String tempprevnav = "";

@override
void initState() {
    // TODO: implement initState
    super.initState();
    tempprevnav = widget.prevnav;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:Container(
          color: Constants.darkAccent,
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Container(
                    height: 130,
                    padding:EdgeInsets.only(left: 10),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Constants.darkAccent,
                      ),
                      accountEmail: Text(''), // keep blank text because email is required
                      accountName: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                              color: const Color(0xff7c94b6),
                              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Constants.darkAccent,
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Ralph Nseir',style: TextStyle(color: Colors.white,fontSize: 14),),
                                Text('ralph_nseir@gmail.com',style:TextStyle(color: Colors.grey,fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.only(left:30),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Articles",style: TextStyle(color: (tempprevnav=="Articles")?Constants.lightAccent:Colors.white),),
                          leading: FaIcon(FontAwesomeIcons.lightbulb,color: (tempprevnav=="Articles")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TipsPage()));
                        },),//Icon(Icons.accessibility_new_outlined),),
                        ListTile(
                          title: Text("Summary",style: TextStyle(color:(tempprevnav=="Summary")?Constants.lightAccent:Colors.white),),
                          leading: FaIcon(FontAwesomeIcons.fileAlt,color: (tempprevnav=="Summary")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SummaryPage()));
                        },),
                        ListTile(
                          title: Text("Exercises",style: TextStyle(color:(tempprevnav=="Exercise")?Constants.lightAccent:Colors.white),),
                          leading: FaIcon(FontAwesomeIcons.running,color: (tempprevnav=="Exercise")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ExercisesPage()));
                        },),
                        ListTile(
                          title: Text("Medical Profile",style: TextStyle(color:(tempprevnav=="Medical")?Constants.lightAccent:Colors.white),),
                          leading: FaIcon(FontAwesomeIcons.firstAid,color: (tempprevnav=="Medical")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MedicalProfilePage()));
                        },),//Icon(Icons.analytics_outlined)),
                        ListTile(
                          title: Text("Session",style: TextStyle(color:(tempprevnav=="Session")?Constants.lightAccent:Colors.white),),
                          leading: Icon(Icons.videocam_outlined,color:(tempprevnav=="Session")?Constants.lightAccent: Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MeetingPage()));
                        },),
                        ListTile(
                          title: Text("Settings",style: TextStyle(color:(tempprevnav=="Settings")?Constants.lightAccent:Colors.white),),
                          leading: Icon(Icons.settings_outlined,color: (tempprevnav=="Settings")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SettingsPage()));
                        },),
                        ListTile(
                          title: Text("Contact Us",style: TextStyle(color:(tempprevnav=="ContactUs")?Constants.lightAccent:Colors.white),),
                          leading: Icon(Icons.phone_outlined,color: (tempprevnav=="ContactUs")?Constants.lightAccent:Colors.white,),
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ContactUsPage()));
                        },),
                      ],
                    ),
                  ),
                ],),
              ),
              Container(
                padding: EdgeInsets.only(left:30),
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: ListTile(
                      title: Text("LogOut",style: TextStyle(color:Colors.white),),
                      leading: Icon(Icons.logout,color: Colors.white,), onTap: (){
                      Clearinformation();
                    },),)
              )
            ],
          ),
        )
    );
  }

  Clearinformation()async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear(); // -> to be placed when API is set
    sharedpreferences.commit(); //-> to be placed when API is set
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=> LoginScreen()), (Route<dynamic> route) => false);
  }
}
