import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
class MeetingPage extends StatefulWidget {
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {

  TextEditingController meetingNumberController = new TextEditingController();
  TextEditingController meetingPasswordController = new TextEditingController();

  FocusNode _focus = new FocusNode();

  void _onFocusChange(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  _launch(url) async {
    if (await canLaunch(url)){
      await launch(url);
    } else {
      print("Not supported");
    }
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.darkAccent,
          title: Text("Session", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
          iconTheme: IconThemeData(color: Constants.lightAccent),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text("July 13,2021", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                Spacer(),
                Text("8am - 10am", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                Spacer(),
                Spacer(),
                Text("This meeting is set to discuss your medical condition concerning your back pain.",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16),),
                // Padding(padding: EdgeInsets.only(top:20),
                // child: Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("Session Date:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                //         Text("16/08/2025", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                //       ],
                //     ),
                //   ],
                // ),
                // ),
                // Padding(padding: EdgeInsets.only(top:20),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text("Session ID:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                //           Text("123456789", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(padding: EdgeInsets.only(top:20),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text("Session Password:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                //           Text("A1B2C3D4", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Column(
                  children: [
                    //Container(height: 80),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      padding: EdgeInsets.only(top:30),
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
                            // showDialog(context: context, builder: (context) {
                            //   return onButtonPressed("Join Meeting", "Meeting Number", "Meeting Password", "Join");
                            //
                            // });
                            _launch("https://us05web.zoom.us/j/3551658315?pwd=NFdRZHltUG1ENGMwdG9DNFJSZWdyUT09");
                          },
                          child: Text("Join",style: TextStyle(color: Constants.lightAccent))
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        drawer: AppDrawer("Session"),

    );
  }


  onButtonPressed(String header, String id,String password, String enter){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width/2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(header,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
                      ), //${entries[index].title}
                    ],
                  ),
                  Container(height: 20),
                  TextFormField(
                    controller:  meetingNumberController,
                    style: TextStyle(color: Constants.textPrimary),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                        hintText: id,
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $id';
                      }
                      return null;
                    },
                  ),
                  Container(height: 10),
                  TextFormField(
                    focusNode: _focus,
                    controller:  meetingPasswordController,
                    style: TextStyle(color: Constants.textPrimary),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                        hintText: password,
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $password';
                      }
                      return null;
                    },
                  ),
                  Container(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel",style: TextStyle(color: Colors.black),)
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, child: Text(enter,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }



}
