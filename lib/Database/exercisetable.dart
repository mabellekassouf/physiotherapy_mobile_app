class ExercisesTable{
  static const tId="ExerciseId";
  static const tTitle = "ExerciseTitle";
  static const tDescription = "ExerciseDescription";
  static const tTime = "ExerciseTime";
  static const tImageUrl= "ImageUrl";
  static const tVideoUrl = "VideoUrl";
}

String queryGetExercises = "CREATE TABLE IF NOT EXISTS EXERCISES( "
    "${ExercisesTable.tId} INTEGER PRIMARY KEY,"
    "${ExercisesTable.tTitle} TEXT,"
    "${ExercisesTable.tDescription} TEXT,"
    "${ExercisesTable.tTime} INTEGER),"
    "${ExercisesTable.tImageUrl} TEXT,"
    "${ExercisesTable.tVideoUrl} TEXT";