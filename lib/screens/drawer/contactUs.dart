import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }


  _launch(url) async {
    if (await canLaunch(url)){
      await launch(url);
    } else {
      print("Not supported");
    }
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.darkAccent,
          title: Text("Contact Us", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
          iconTheme: IconThemeData(color: Constants.lightAccent),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
              "Waterbear team is always one click away, feel free to contact us anytime.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
          Spacer(),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(Icons.phone,color: Colors.white,),
                TextButton(
                  onPressed: (){
                    _launch(Constants.phoneNumberlaunch);
                    },
                  child: Text("Call Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                ),
              ],
            ),
          ),
              Container(height: 15,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,),
                    TextButton(
                      onPressed: (){
                        FlutterOpenWhatsapp.sendSingleMessage(Constants.WAnumber, "");
                      },
                      child: Text("Whatsapp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
              Container(height: 15,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.mailBulk,color: Colors.white,),
                    TextButton(
                      onPressed: (){
                        _launch(Constants.emaillaunch);
                      },
                      child: Text("Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),

              Container(height: 15,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                    TextButton(
                      onPressed: (){
                        _launch(Constants.instagram);
                      },
                      child: Text("Instagram",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),

              Container(height: 15,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_sharp,color: Colors.white,),
                    TextButton(
                      onPressed: (){
                        _launch(Constants.addressLaunch);
                      },
                      child: Text("Address",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),

              Container(height: 15,),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.globe,color: Constants.lightAccent,),
                    TextButton(
                      onPressed: (){
                        _launch(Constants.website);
                      },
                      child: Text("Website",style: TextStyle(color: Constants.lightAccent,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
        drawer: AppDrawer("ContactUs"),
    );
  }
}
