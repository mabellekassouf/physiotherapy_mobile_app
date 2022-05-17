import 'package:flutter/material.dart';
import 'package:waterbear_movement/screens/exercise/time_to_start.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:waterbear_movement/APIs/getapi.dart';
import 'package:waterbear_movement/Database/database.dart';
import 'package:waterbear_movement/Models/Exercises.dart';
class ExercisesListScreen extends StatefulWidget {
  @override
  _ExercisesListScreenState createState() => _ExercisesListScreenState();
}

class _ExercisesListScreenState extends State<ExercisesListScreen> {
  //database helper
 // WaterBearDB databaseHelper = WaterBearDB();

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
            child:  Column(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Workout Name",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("2",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20.0),),
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
                        Container(
                            color: Colors.white,
                            height: 460,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child:Column(children: [
                           //   FutureBuilder<List<ExerciseModel>>(
                           //       future: databaseHelper.getallExercises(),
                           //       builder: (context, snapshot) {
                           //         if (snapshot.connectionState != ConnectionState.done) {
                           //           // return: show loading widget
                           //         }
                           //         if (snapshot.hasError) {
                           //           // return: show error widget
                           //         }
                           //         print("Entering here 1");
                           //         List<ExerciseModel> entries=snapshot.data!=null?snapshot.data:[];
                             /*       return */  Flexible( child:
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        //shrinkWrap: true,
                                        itemCount: 8,  //entries.length
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                              height: 75,
                                              // color: Colors.amber[colorCodes[index]],
                                              child: Column(children: [
                                                ListTile(
                                                  trailing: Text('20 ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),), //${entries[index].time}
                                                  title: TextButton(
                                                    style: ButtonStyle(
                                                      alignment: Alignment.centerLeft,
                                                    ),
                                                      child: Text('Push ups',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 15),),
                                                    onPressed: (){
                                                      showDialog(context: context, builder: (context) {
                                                        return Dialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                          ),
                                                          child: Container(
                                                            height: MediaQuery.of(context).size.height/1.3,
                                                            width: MediaQuery.of(context).size.width/2,
                                                            child: Padding(
                                                              padding: EdgeInsets.all(0),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    height: MediaQuery.of(context).size.height/2,
                                                                    decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                        image: AssetImage(
                                                                          "assets/images/samplegif.gif",
                                                                        ),  //entries[index].thumbnailUrl
                                                                        fit: BoxFit.fill,
                                                                      ),
                                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        // IconButton(
                                                                        //     icon: Icon(Icons.close_rounded),
                                                                        //     color: Colors.white,
                                                                        //     iconSize: 30,
                                                                        //     onPressed: (){
                                                                        //       Navigator.pop(context);
                                                                        //     }),
                                                                        // Padding(
                                                                        //   padding: const EdgeInsets.only(top: 15.0,left: 5),
                                                                        //   child: Text('Push ups',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),),
                                                                        // ), //${entries[index].title}
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                                                                          child: Text('This is a sample exercise that mainly targets the abdomen area. This etc etc.....'),
                                                                        ), //${entries[index].description}
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  ),//${entries[index].title}
                                                  leading: Container(
                                                      child: GestureDetector(
                                                        onTap: ()
                                                        {
                                                          showDialog(context: context, builder: (context) {
                                                            return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20),
                                                              ),
                                                              child: Container(
                                                                height: MediaQuery.of(context).size.height/1.3,
                                                                width: MediaQuery.of(context).size.width/2,
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(0),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.height/2,
                                                                        decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                            image: AssetImage(
                                                                              "assets/images/samplegif.gif",
                                                                            ),  //entries[index].thumbnailUrl
                                                                            fit: BoxFit.fill,
                                                                          ),
                                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                                                        ),
                                                                        child: Row(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            // IconButton(
                                                                            //     icon: Icon(Icons.close_rounded),
                                                                            //     color: Colors.white,
                                                                            //     iconSize: 30,
                                                                            //     onPressed: (){
                                                                            //       Navigator.pop(context);
                                                                            //     }),
                                                                            // Padding(
                                                                            //   padding: const EdgeInsets.only(top: 15.0,left: 5),
                                                                            //   child: Text('Push ups',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),),
                                                                            // ), //${entries[index].title}
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Center(
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                                                                              child: Text('This is a sample exercise that mainly targets the abdomen area. This etc etc.....'),
                                                                            ), //${entries[index].description}
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                        },
                                                        child: Image(
                                                          width: 60,
                                                          height: 60,
                                                          alignment: Alignment.centerLeft,
                                                          fit: BoxFit.fill,
                                                          image:NetworkImage('https://www.muscleandfitness.com/wp-content/uploads/2018/02/1109-feet-elevated-pushup.jpg?w=940&h=529&crop=1&quality=86&strip=all'),),//entries[index].thumbnailUrl
                                                        ),
                                                      ),
                                                      ),

                                                Divider(),
                                              ],)
                                          );
                                        }
                                    )
                                    ) /*;
                                  })*/
                            ],)
                        ),
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
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context){
                                      return TimerToStart();
                                    },
                                  ),
                                );
                              },
                              child: Text("Let's Go",style: TextStyle(color: Constants.lightAccent))
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
