import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterbear_movement/screens/article_detail.dart';
import 'package:waterbear_movement/screens/article_detail_video.dart';
import 'package:waterbear_movement/screens/authentication/login.dart';
import 'package:waterbear_movement/utilities/constants.dart';
import 'package:waterbear_movement/widgets/app_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {

  List Users =[];
  bool _isLoading = false;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    // checkLoginStatus();
    fetchUserData();
  }

  fetchUserData() async {
    var api = "";
    try {
      var response = await http.get(Uri.parse(api));
      if(response.statusCode == 200){
        var items = json.decode(response.body)['place json title here ex. the users name'];
        setState(() {
          Users = items;
        });
      }
      else{
        setState(() {
          Users = [];
        });
      }
    }
    catch(e){
      print("Exception$e");
    }
  }

  checkLoginStatus () async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token")==null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=> LoginScreen()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("Articles", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,bottom: 10),
                child: Text("New Today",style: TextStyle(fontWeight: FontWeight.w700,color: Constants.lightAccent,fontSize: 20),),
              ),
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
                        height: MediaQuery.of(context).size.height/2.3,  //original 2.3
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        // color: Colors.amber[colorCodes[index]],
                        child: Column(
                          children: [
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 FlatButton(
                                   padding:EdgeInsets.zero,
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: Image(
                                        fit: BoxFit.cover,
                                        height:MediaQuery.of(context).size.height/2.70,
                                        width: MediaQuery.of(context).size.width,
                                        image: (index%2==0)?AssetImage('assets/images/Scoliosis.jpg'):AssetImage('assets/images/Exoftheweek.jpg'),
                                     ),
                                   ),
                                   onPressed: (){
                                     if(index%2==0)
                                     {
                                       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ArticleDetailVideoScreen()));
                                     }
                                     else
                                     {
                                       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ArticleDetailScreen()));
                                     }
                                   },
                                 ),
                                //entries[index].thumbnailUrl
                                Container(height: 5),
                                 GestureDetector(
                                   onTap: (){
                                     if(index%2==0)
                                       {
                                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ArticleDetailVideoScreen()));
                                       }
                                     else
                                       {
                                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ArticleDetailScreen()));
                                       }

                                   },
                                     child: Container(
                                         child: Text("The Power of Meditation for Scoliosis",style: TextStyle(fontWeight: FontWeight.w700),
                                         ),
                                     ),
                                 ),
                              ],
                            ), //${entries[index].title}

                          ),
                        ],)
                    );
                  }
              )
              ) /*;
                                  })*/
            ],
          ),
      ),
      drawer: AppDrawer("Articles"),
    );
  }
}
