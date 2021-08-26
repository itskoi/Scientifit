import 'package:flutter/material.dart';

class DiaryEntry {

  DiaryEntry( {required this.name, required this.date, this.description} );

  DateTime date;
  String? description;
  String name;
}

enum DurationUnit {
  rep, second
}

enum ExerciseType {
  Strength, Endurance, Balance, Flexibility
}

enum CaloriesUnit {
  cal, kcal
}

class ExerciseEntry extends DiaryEntry {

  ExerciseEntry({required name, required date, description, required this.caloriesBurned,  required this.caloriesUnit,
    required this.type, required this.duration, required this.durationUnit}) : super(name:name, date:date);

  int caloriesBurned;
  CaloriesUnit caloriesUnit = CaloriesUnit.kcal;
  ExerciseType type;
  int duration;
  DurationUnit durationUnit;

  String getCaloriesUnit() => caloriesUnit == CaloriesUnit.cal ? 'cal' : 'kcal';
  String getExerciseType() {
    switch(type) {
      case ExerciseType.Strength:
        return 'Strength';
      case ExerciseType.Balance:
        return 'Balance';
      case ExerciseType.Endurance:
        return 'Endurance';
      case ExerciseType.Flexibility:
        return 'Flexibility';
    }
  }
  String getDurationUnit() => durationUnit == DurationUnit.second ? 'sec' : 'rep';
}

ExerciseEntry pushup = ExerciseEntry(name: 'Push up', date: DateTime.now(), caloriesBurned: 200,
    caloriesUnit: CaloriesUnit.kcal, type: ExerciseType.Strength, duration: 15,
    durationUnit: DurationUnit.rep);
ExerciseEntry pullup = ExerciseEntry(name: 'Pull up', date: DateTime.now(), caloriesBurned: 200,
    caloriesUnit: CaloriesUnit.kcal, type: ExerciseType.Strength, duration: 15,
    durationUnit: DurationUnit.rep);

class FoodEntry extends DiaryEntry {

  FoodEntry( { required name, required date, description,
    required this.caloriesGained, required this.caloriesUnit } ) : super(name: name, date: date);

  int caloriesGained;
  CaloriesUnit caloriesUnit = CaloriesUnit.kcal;
  String getCaloriesUnit() => caloriesUnit == CaloriesUnit.cal ? 'cal' : 'kcal';
}

FoodEntry pho = FoodEntry(name: 'Pho', date: DateTime.now(), caloriesGained: 308,
    caloriesUnit: CaloriesUnit.kcal);
FoodEntry pizza = FoodEntry(name: 'Pizza', date: DateTime.now(), caloriesGained: 308,
    caloriesUnit: CaloriesUnit.kcal);
FoodEntry bunbo = FoodEntry(name: 'Bun Bo', date: DateTime.now(), caloriesGained: 308,
    caloriesUnit: CaloriesUnit.kcal);


