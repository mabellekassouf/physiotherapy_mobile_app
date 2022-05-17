import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waterbear_movement/screens/authentication/signup.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class SettingUpScreen extends StatefulWidget {
  @override
  _SettingUpScreenState createState() => _SettingUpScreenState();
}

class _SettingUpScreenState extends State<SettingUpScreen> {


  startTimeout() {
    return  Timer(Duration(seconds: 7), changeScreen);
  }
//
  changeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context){
          return SignUpPage();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  int _current = 0;
  List imgList = [
    'assets/images/staff1.jpg',
    'assets/images/staff2.jpg',
    'assets/images/staff3.jpg',
    'assets/images/staff4.jpg',
  ];

  List<T> map<T>(List list, Function handler){
    List<T> result=[];
    for(var i= 0;i<list.length;i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Constants.darkAccent,
            child: Stack(
              children: <Widget>[
                CarouselSlider(
                  height: MediaQuery.of(context).size.height/1.6,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 7),
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(milliseconds: 5000),
                  pauseAutoPlayOnTouch: Duration(seconds: 3),
                  onPageChanged: (index){
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(
                        builder: (BuildContext context){
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Constants.darkAccent,
                            ),
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          );
                        });
                  }).toList(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height/1.75,
                  left:MediaQuery.of(context).size.width/2.3,
                  child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(
                      imgList,(index,url){
                    return Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.symmetric(vertical: 18,horizontal: 1.0),
                      decoration: BoxDecoration(shape: BoxShape.circle,
                          color: _current == index? Constants.lightAccent: Colors.grey),
                    );
                  }
                  ),
                ),
    ),
              ],
            ),
          ),
          Spacer(),
          Text("Setting you up",style: TextStyle(color: Constants.darkAccent,fontSize: 18,fontWeight: FontWeight.w700)),
          Spacer(),
          Text("Just a sec, we are getting",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 13)),
          Text("things ready!",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 13)),
          Spacer(),
          Spacer(),
          Spacer(),
          Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Constants.lightAccent),
              ),
            ),
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
