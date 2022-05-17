import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterbear_movement/screens/exercise/Exercises_list.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
class ExercisesPage extends StatefulWidget {
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.darkAccent,
          title: Text("Exercises", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
          iconTheme: IconThemeData(color: Constants.lightAccent),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  children: [
                     Container(
                       color: Colors.white,
                       padding: EdgeInsets.symmetric(horizontal: 20),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(top:20),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Workout Name",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("1",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),
                                            Text("/2",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15.0),),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("STEPS",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 13.0),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                           ),
                           Container(height: 10),
                           Row(
                             children: [
                               Text("Therapist Name",style: TextStyle(color: Colors.grey),),
                             ],
                           ),
                           Container(height: 10),
                           Row(
                             children: [
                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       Icon(Icons.timer),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       FaIcon(FontAwesomeIcons.cloudscale),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       FaIcon(FontAwesomeIcons.exclamation),
                                     ],
                                   ),
                                 ],
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         Text("Time Required", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                       ],
                                     ),
                                     Container(height: 8),
                                     Row(
                                       children: [
                                         Text("Effort Needed", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                       ],
                                     ),
                                     Container(height: 8),
                                     Row(
                                       children: [
                                         Text("Type: ", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                         Text("Rep/Time Based", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                               //Container(height: 5),
                             ],
                           ),
                           Container(height: 15),
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(20)),
                               color: Colors.white
                             ),
                             height: 200,
                             padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                             child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                  Row(
                                     children: [
                                       Text("Description",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                                     ],
                                   ),
                                 Container(height: 5),
                                      Text("This text box will contain the description that the therapist will enter."),

                               ],
                             )
                           ),
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
                                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ExercisesListScreen()));
                                 },
                                 child: Text("Next",style: TextStyle(color: Constants.lightAccent))
                             ),
                           ),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
        ),
        drawer: AppDrawer("Exercise"),

    );
  }
}
