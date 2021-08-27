import 'package:firebase_auth/firebase_auth.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/scientifituser.dart';

User? currentAccount;
ScientifitUser? currentUser;
Map<String, DBExerciseEntry> dbExercise = {};
Map<String, DBFoodEntry> dbFood = {};