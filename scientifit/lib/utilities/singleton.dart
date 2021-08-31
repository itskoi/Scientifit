import 'package:firebase_auth/firebase_auth.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/services/databaseservice.dart';

User? currentAccount;
ScientifitUser? currentUser;
DatabaseService? databaseService;
Map<String, DBExerciseEntry> dbExercise = {};
Map<String, DBFoodEntry> dbFood = {};