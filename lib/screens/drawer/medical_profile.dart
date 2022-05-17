import 'package:flutter/material.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
class MedicalProfilePage extends StatefulWidget {
  @override
  _MedicalProfilePageState createState() => _MedicalProfilePageState();
}

class _MedicalProfilePageState extends State<MedicalProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Medical Profile", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      drawer: AppDrawer("Medical"),
    );
  }
}
