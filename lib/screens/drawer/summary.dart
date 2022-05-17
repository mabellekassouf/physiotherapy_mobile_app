import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/goal.dart';
import 'package:waterbear_movement/screens/introduction/painlocation.dart';
import 'package:waterbear_movement/screens/water_intake.dart';
import 'package:waterbear_movement/screens/wellbeingscale.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:waterbear_movement/widgets/line_chart_widget.dart';
class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  String goal = "";
  String painLocation = "";
  String painRate = "";
  String wellBeing = "None";
  String wellBeingNumber = "-";
  String water= "0";
  String exercises = "0";
  SharedPreferences sharedPreferences;

  getpreferences () async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString("Goal")!=null){
        goal = sharedPreferences.getString("Goal");
      }
      if(sharedPreferences.getString("PainLocation")!=null){
        painLocation = sharedPreferences.getString("PainLocation");
      }
      if(sharedPreferences.getString("painRate")!=null){
        painRate = sharedPreferences.getString("painRate");
      }
      if(sharedPreferences.getString("wellBeing")!=null){
        wellBeing = sharedPreferences.getString("wellBeing");
      }
      if(sharedPreferences.getString("wellBeingNumber")!=null){
        wellBeingNumber = sharedPreferences.getString("wellBeingNumber");
      }
      if(sharedPreferences.getString("Water")!=null){
        water = sharedPreferences.getString("Water");
      }
      if(sharedPreferences.getString("CompletedExercises")!=null){
        exercises = sharedPreferences.getString("CompletedExercises");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Summary", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: goalSection()
              ),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BMISection(),
              ),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: generalSection("Pain",painRate,painLocation,"In pain"),
              ),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: generalSection("Well Being",wellBeingNumber,wellBeing,"How are you feeling"),
              ),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: generalSection("Progress for the Day",exercises,"Completed Exercises:","Details"),
              ),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Constants.darkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: generalSection("Water Intake",water,"Cups:","Add"),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer("Summary"),
    );
  }

  goalSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                child: Row(
                  children: [
                    Expanded(child: Text("Goal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 17),)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          child: Text("New Goal",style: TextStyle(color: Colors.grey,fontSize: 10)),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerRight
                          ),
                          onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> GoalScreen("SummaryScreen")));
                          },
                        ),
                        Container(
                          width: 5,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft,
                            iconSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(goal,style: TextStyle(color: Constants.lightAccent,fontWeight: FontWeight.w700,fontSize: 15),),
              ),
            ],
          ),
        )
      ],
    );
  }

  BMISection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 10,bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BMI",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17,color:Colors.white)),
              Container(height: 20),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                child: Row(
                  children: [
                    Expanded(child: Text("Underweight",style: TextStyle(color: Constants.lightAccent,fontSize: 15,fontWeight: FontWeight.w700),)),
                    Text("18.5",style: TextStyle(color: Constants.lightAccent,fontSize: 15,fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  generalSection(String title, String result, String outcome, String addinfo){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                child: Row(
                  children: [
                    Expanded(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 17),)),
    (title=="Progress for the Day")?Container(height: 45):Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          child: Text(addinfo,style: TextStyle(color: Colors.grey,fontSize: 10)),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                          ),
                          onPressed: (){
                          if(title=="Well Being")
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> WellBeingScaleScreen()));
                            }
                          else if (title=="Water Intake")
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> WaterIntakeScreen()));
                            }
                          else if (title=="Pain")
                          {
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PainLocationScreen("Summary")));
                          }

                          },
                        ),
                        Container(
                          width: 5,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft,
                            iconSize: 10,
                            onPressed: (){

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                child: Row(
                  children: [
                    Expanded(child: Text(outcome,style: TextStyle(color: Constants.lightAccent,fontSize: 15,fontWeight: FontWeight.w700),)),
                    Text(result,style: TextStyle(color: Constants.lightAccent,fontSize: 15,fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
