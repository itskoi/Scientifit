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

class DBDiaryEntry {

  DBDiaryEntry( {required this.did, required this.name, this.description = ''} );

  String did;
  String description;
  String name;
}

class DBExerciseEntry extends DBDiaryEntry {

  DBExerciseEntry({required did, required name, description, required this.caloriesBurnedPerUnit, this.caloriesUnit = 'kcal',
    required this.muscles, required this.level, required this.type, this.durationUnit = 'rep'}) : super(did: did, name:name, description: description);

  int caloriesBurnedPerUnit;
  List<String> muscles;
  String level;
  String caloriesUnit;
  String type;
  String durationUnit;
}

class DBFoodEntry extends DBDiaryEntry {

  DBFoodEntry( { required did, required name, description, required this.caloriesGainedPerUnit, this.caloriesUnit = 'kcal',
    this.servingUnit = 'g'} ) : super( did: did, name: name, description: description);

  int caloriesGainedPerUnit;
  String caloriesUnit;
  String servingUnit;
}