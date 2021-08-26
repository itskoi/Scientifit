import 'package:scientifit/models/diaryentry.dart';

class Account {

  Account( { required this.uid, required this.username, required this.email} );

  String uid;
  String username;
  String email;

  Map<String, List<FoodEntry>> _myFoodEntries = {};
  Map<String, List<ExerciseEntry>> _myExEntries = {};

  ExerciseEntry getExercise(String date, int index) => _myExEntries[date]![index];
  FoodEntry getFood(String date, int index) => _myFoodEntries[date]![index];

  int countEntries(String date) =>  countFoods(date) + countExercises(date);
  int countFoods(String date) {
    return _myFoodEntries[date] == null ? 0 : _myFoodEntries[date]!.length;
  }
  int countExercises(String date) {
    return _myExEntries[date] == null ? 0 : _myExEntries[date]!.length;
  }

  void addExercise(String date, ExerciseEntry ex) {
    if (_myExEntries[date] == null) _myExEntries[date] = [];
    _myExEntries[date]?.add(ex);
  }

  void addFood(String date, FoodEntry food) {
    if (_myFoodEntries[date] == null) _myFoodEntries[date] = [];
    _myFoodEntries[date]?.add(food);
  }
}