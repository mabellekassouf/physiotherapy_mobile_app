import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/introduction/goal.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/utilities/countries.dart';
class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  //for country choice
  String countryChoice;
  List countryListView= Countries.ListCountries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 80,right: 80,top: 70,bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Where are you from",style: TextStyle(color: Constants.darkAccent,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                  Container(height: 50),
                  Row(
                          children: [

                            Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Constants.darkAccent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      iconDisabledColor: Constants.lightAccent,
                                      iconEnabledColor: Constants.lightAccent,
                                      hint: Center(child: Text("Choose your country",style: TextStyle(color: Constants.lightAccent,fontWeight: FontWeight.w700),textAlign: TextAlign.center)),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      iconSize: 30,
                                      style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w500),
                                      dropdownColor: Constants.darkAccent,
                                      value: countryChoice,
                                      onChanged: (newvalue){
                                        setState(() {
                                          countryChoice=newvalue;
                                        });
                                      },
                                      items: countryListView.map((valueitem){
                                        return DropdownMenuItem(
                                          child: Text(valueitem),
                                          value: valueitem,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
          ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Constants.darkAccent),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )
                            )
                        ),
                        onPressed: (){
                          SaveAndNext(countryChoice.toString());
                        },
                        child: Text("Continue",style: TextStyle(color: Constants.lightAccent))
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SaveAndNext(String countrychoice)async{
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    setState((){
      sharedpreferences.setString("Country", countrychoice);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> GoalScreen("CountryScreen")));
    });

  }
}
