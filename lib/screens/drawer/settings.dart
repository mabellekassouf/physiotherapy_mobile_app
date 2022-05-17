import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterbear_movement/screens/authentication/change_password.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:image_picker/image_picker.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  //for uploading profile picture
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.darkAccent,
          title: Text("Settings", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
          iconTheme: IconThemeData(color: Constants.lightAccent),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
           child: Column(
             children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.black,
                        child: _image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                            : Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          width: 50,
                          height: 50,
                          child: Center(
                              child: Icon(
                                Icons.person_outline,
                                size: 40,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    Container(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "example_email@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10
                          ),
                        ),
                        Container(height: 3),
                        Row(
                          children: [
                            Text("Assigned Therapist: ",style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,color: Colors.grey),),
                            Text("William Richards",style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,color: Colors.grey),)
                          ],
                        ),
                        Container(height: 3),
                        Container(
                          height:11,
                          child: TextButton(
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ChangePasswordPage())),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.topLeft
                            ),
                            child: Text(
                              "Change password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.underline,
                                  color: Constants.lightAccent,fontSize: 10),),
                          ),
                        ),
                      ],
                    ),

                //    Padding(
                //      padding: const EdgeInsets.only(left: 10.0),
                //      child: TextButton(
                //          onPressed: (){
                //            _showPicker(context);
                //          },
                //          child: _image != null
                //              ?Text("Change Profile Picture", style: TextStyle(color: Colors.grey,fontSize: 15.0),)
                //              : Text("Upload Profile Picture", style: TextStyle(color: Colors.grey,fontSize: 15.0),)),
                //    ),
                  ],
                ),
               Container(height: 15),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.warning_amber_outlined),
                   Text("Trial Version. Contact Clinic for More Info.",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 10),),
                 ],
               ),
               Container(height: 20),
               Container(
                 width: MediaQuery.of(context).size.width/1.65,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Name",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 13),),
                     TextFormField(
                       readOnly: true,
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         hintText: "David Web",
                         hintStyle: TextStyle(
                           color: Constants.lightAccent,
                         ),
                         isDense: true,
                         contentPadding: EdgeInsets.symmetric(vertical: 5)
                       ),
                     ),

                     Container(height: 15),
                     Text("Phone Number",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 13),),
                     TextFormField(
                       readOnly: true,
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           hintText: "03123456",
                           hintStyle: TextStyle(
                             color: Constants.lightAccent,
                           ),
                           isDense: true,
                           contentPadding: EdgeInsets.symmetric(vertical: 5)
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
        ),
        drawer: AppDrawer("Settings"),
    );
  }



  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
}
