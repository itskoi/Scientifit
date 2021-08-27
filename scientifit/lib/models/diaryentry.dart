/* ==========================

enum DurationUnit {
  rep, second
}

enum ExerciseType {
  Strength, Endurance, Balance, Flexibility
}

enum CaloriesUnit {
  cal, kcal
}

enum ServingUnit {
  g, kg, ml, l, pound, grain
}

========================== */

class ExerciseEntry {

  ExerciseEntry({required this.did, required this.date, required this.caloriesBurned, required this.duration} );

  String did;
  String date;

  int caloriesBurned;
  int duration;
}

class FoodEntry {

  FoodEntry( { required this.did, required this.date, required this.caloriesGained, this.servingSize = 1} );

  String did;
  String date;

  int caloriesGained;
  int servingSize;
}


