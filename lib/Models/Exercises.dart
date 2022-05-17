import 'package:video_player/video_player.dart';
import 'package:waterbear_movement/Database/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waterbear_movement/Database/exercisetable.dart';

class ExerciseModel {
  int id;
  String title;
  String description;
  String time;
  String videoUrl;
  String ImageUrl;
  VideoPlayerController controller;

  ExerciseModel({this.id, this.title, this.description, this.time, this.videoUrl, this.ImageUrl});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    id = json['ExerciseId'];
    title = json['ExerciseTitle'];
    description = json['ExerciseDescription'];
    time = json['Time'];
    videoUrl = json['VideoUrl'];
    ImageUrl = json['ImageUrl'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExerciseId'] = this.id;
    data['ExerciseTitle'] = this.title;
    data['ExerciseDescription'] = this.description;
    data['Time'] = this.time;
    data['ImageUrl'] = this.ImageUrl;
    data['VideoUrl'] = this.videoUrl;
    return data;
  }
  static insertExercise(ExerciseModel exerciseModel) async {
    var dbStore = WaterBearDB();
    Database db = await dbStore.database;
    try {
      var query = db.rawQuery(
          "INSERT OR REPLACE INTO EXERCISES"
              "("
              "${ExercisesTable.tId},"
              "${ExercisesTable.tTitle},"
              "${ExercisesTable.tDescription},"
              "${ExercisesTable.tTime}"
              "${ExercisesTable.tImageUrl}"
              "${ExercisesTable.tVideoUrl}"
              ")"
              "VALUES"
              "("
              "?,"
              "?,"
              "?,"
              "?,"
              "?,"
              "?)",
          [

            exerciseModel.id,
            exerciseModel.title,
            exerciseModel.description,
            exerciseModel.time,
            exerciseModel.ImageUrl,
            exerciseModel.videoUrl,
          ]);
      return query;
    } catch (e) {
      print("exception from database : $e");
    }
  }
}