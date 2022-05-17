import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class ArticleDetailScreen extends StatefulWidget {
  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("The Power of Meditation", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height/2.2,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                    'assets/images/Exoftheweek.jpg',
                  fit: BoxFit.fill,
                ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Text("The Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditation",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
