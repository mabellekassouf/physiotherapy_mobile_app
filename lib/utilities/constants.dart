import 'package:flutter/material.dart';
class Constants{

  //Company Information
  static  String appName = "Waterbear Movement";
  static double titleSize = 20.0;
  static String WAnumber = "+96176453056";
  static String phoneNumberlaunch = 'tel:+96176453056';
  static String phoneNumber = '+96176453056';
  static String emaillaunch = 'mailto:action@waterbear-mena.com?subject=Subject&body=Greetings';
  static String email = 'action@waterbear-mena.com';
  static String website = 'https://waterbear-mena.com';
  static String instagram = 'https://instagram.com/waterbear_movement?utm_medium=copy_link';
  static String address = 'Lebanon, Maten, Dbayeh - \nSaint Rita school street, NDU\nInnovation and enterprise - \nBloc A, first floor';
  static String addressLaunch = 'https://maps.app.goo.gl/yQ1nm97Zsyf42GVg6';

  //Database Information
  static String APISignUp = "";


  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary =Color(0xffF2F2F2);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xffFFC500);
  static Color darkAccent = Color(0xff475057);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];
  static Color textPrimary = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );


}