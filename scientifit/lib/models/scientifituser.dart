import 'package:scientifit/models/diaryentry.dart';

class ScientifitUser {
  
  ScientifitUser( { required this.uid,  required this.username, required this.email, required this.height,
    required this.weight, required this.myFoodEntries, required this.myExEntries} );
  
  String uid;
  String username;
  String email;

  int height;
  int weight;

  List<FoodEntry> myFoodEntries = [];
  List<ExerciseEntry> myExEntries = [];

  List<ExerciseEntry> getExercisesWithDate(String date) {
    List<ExerciseEntry> result = [];
    myExEntries.forEach((element) {
      if (element.date == date)
        result.add(element);
    });
    return result;
  }

  List<FoodEntry> getFoodsWithDate(String date) {
    List<FoodEntry> result = [];
    myFoodEntries.forEach((element) {
      if (element.date == date)
        result.add(element);
    });
    return result;
  }
}