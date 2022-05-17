import 'dart:io';

import 'package:waterbear_movement/Models/Exercises.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import'package:sqflite/sqflite.dart';

import 'exercisetable.dart';


class WaterBearDB{

  Database db;


  Future<Database> get database async{
    if(db!=null){
      return db;
    }
    db=await initDB();
    return db;
  }
  initDB()async{
    Database db=await openDatabase(
        await dbPath(),
        version:0,
        onCreate: createdb,
        onUpgrade: updatedb);
    return db;

  }
  static Future<String> dbPath()async{
    Directory d=await getApplicationDocumentsDirectory();

    String path=join(d.path,"waterbear.db");
    print("path database:");
    print(path);
    return path;
  }
  void createdb(Database db,int version) async
  {
    db.execute(queryGetExercises);

  }
  updatedb(Database db,int oldVersion,int newversion) async{

    //
    //await db.execute("ALTER TABLE IF EXISTS USER ADD COLUMN Role TEXT");
    // await db.execute("ALTER TABLE IF EXISTS USER ADD COLUMN Token TEXT");
    //
    //
    createdb(db, newversion);
  }


  Future<List<ExerciseModel>> getallExercises()async{
    Database db=await this.database;
    try{
      print("get all exercises try");
      var query=await db.rawQuery("SELECT * FROM EXERCISES");

      List<Map> result=query;
      List<ExerciseModel> listofallexercise=[];
      for(var u in result){
        print("from for");
        ExerciseModel exerciseModel=ExerciseModel.fromJson(u);
        listofallexercise.add(exerciseModel);
      }
      print("database get list done");
      return listofallexercise;




    }catch(e){

    }
  }







}