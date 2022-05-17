import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:waterbear_movement/screens/authentication/login.dart';
import 'package:waterbear_movement/screens/introduction/full_name_screen.dart';

import 'package:waterbear_movement/utilities/constants.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  bool _isLoading = true;
  startTimeout() {
    return  Timer(Duration(seconds: 1), changeLoading);
  }
//
  changeLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }



  int _current = 0;
  List imgList = [
    'assets/images/resilience.png',
    'assets/images/intro1.jpg',
    'assets/images/intro2.jpg',
    'assets/images/intro3.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height /1.6,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 6),
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(milliseconds: 5000),
                  pauseAutoPlayOnTouch: Duration(seconds: 3),
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items:imgList.map((imgUrl) {
                    return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              color: Constants.darkAccent,
                            ),
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          );
                        });
                  }).toList(),
                ),
                    Positioned(
                      top: MediaQuery.of(context).size.height/1.75,
                      left:MediaQuery.of(context).size.width/2.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                            imgList, (index, url) {
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 1.0),
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                color: _current == index
                                    ? Constants.lightAccent
                                    : Colors.grey),
                          );
                        }
                        ),
                      ),
                    ),
              ],
            ),
          ),
          Spacer(),
          Text("Welcome to Waterbear", style: TextStyle(
              color: Constants.darkAccent,
              fontSize: 24,
              fontWeight: FontWeight.w700)),
          Spacer(),
          Text("Leading the industry in physiotherapy",
              style: TextStyle(color: Colors.grey)),
          Text("offering best in class solutions",
              style: TextStyle(color: Colors.grey)),
          Text("for your problem!", style: TextStyle(color: Colors.grey)),
          Spacer(),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 2,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Constants.darkAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    )
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FullNameScreen()));
                },
                child: Text("Let's get Started",
                    style: TextStyle(color: Constants.lightAccent))
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already a user?",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),),
              Container(
                width:40,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                  ),
                  child: Text("Sign in", style: TextStyle(
                      color: Constants.lightAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline),),
                ),
              ),
            ],
          ),
          Text("After proceeding you agree to",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text("our terms and conditions",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          Spacer(),
        ],
      ),
    );
  }
}