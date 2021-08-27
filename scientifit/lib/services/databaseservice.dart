import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/utilities/singleton.dart';

class DatabaseService {

  DatabaseService( {required this.uid} );

  final String uid;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference dbExCollection = FirebaseFirestore.instance.collection('exercises');
  final CollectionReference dbFoodCollection = FirebaseFirestore.instance.collection('foods');

  // Add new user data
  Future addNewUser({required String username, required String email,
    int height = 170, int weight = 60}) async {
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'height' : height,
      'weight' : weight,
      'myExEntries' : [],
      'myFoodEntries' : []
    }).then((value) => print("Account Added"))
        .catchError((error) => print("Failed to add the account: $error"));
  }

  // Add exercise to Diary
  Future addExerciseToDiary(ExerciseEntry ex) async {
    List<ExerciseEntry> myExEntries = currentUser!.myExEntries;
    myExEntries.add(ex);
    return await userCollection.doc(uid).set({
      'username' : currentUser!.username,
      'email' : currentUser!.email,
      'height' : currentUser!.height,
      'weight' : currentUser!.weight,
      'myExEntries' : myExEntries.map((e) => {
        'did' : e.did,
        'date' : e.date,
        'caloriesBurned' : e.caloriesBurned,
        'duration' : e.duration
      }).toList(),
      'myFoodEntries' : currentUser!.myFoodEntries.map((e) => {
        'did' : e.did,
        'date' : e.date,
        'caloriesGained' : e.caloriesGained,
        'servingSize' : e.servingSize
      })
    });
  }

  // Add food to Diary
  Future addFoodToDiary(FoodEntry food) async {
    List<FoodEntry> myFoodEntries = currentUser!.myFoodEntries;
    myFoodEntries.add(food);
    return await userCollection.doc(uid).set({
      'username' : currentUser!.username,
      'email' : currentUser!.email,
      'height' : currentUser!.height,
      'weight' : currentUser!.weight,
      'myExEntries' : currentUser!.myExEntries.map((e) => {
        'did' : e.did,
        'date' : e.date,
        'caloriesBurned' : e.caloriesBurned,
        'duration' : e.duration
      }).toList(),
      'myFoodEntries' : myFoodEntries.map((e) => {
        'did' : e.did,
        'date' : e.date,
        'caloriesGained' : e.caloriesGained,
        'servingSize' : e.servingSize
      }).toList()
    });
  }

  // Get user stream
  ScientifitUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return ScientifitUser(
        uid: uid,
        username: snapshot['username'],
        email: snapshot['email'],
        height: snapshot['height'],
        weight: snapshot['weight'],
        myFoodEntries: List.from(snapshot['myFoodEntries']).map((e) => FoodEntry(
            did: e['did'],
            date: e['date'],
            caloriesGained: e['caloriesGained'],
            servingSize: e['servingSize']
        ),
        ).toList(),
        myExEntries: List.from(snapshot['myExEntries']).map((e) => ExerciseEntry(
            did: e['did'],
            date: e['date'],
            caloriesBurned: e['caloriesBurned'],
            duration: e['duration'])
        ).toList()
    );
  }

  Stream<ScientifitUser> get userData => userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);

  // Get Database Exercise
  Future<Map<String, DBExerciseEntry>> getDBExercises() async {
    try {
      final QuerySnapshot<Object?> snapshot = await dbExCollection.get();
      Map<String, DBExerciseEntry> result = {};
      for (int i = 0; i < snapshot.docs.length; i++) {
        final doc = snapshot.docs[i];
        // print('Tester: ${snapshot.docs[i].id}');
        result[doc.id] = DBExerciseEntry(
            did: doc.id,
            name: doc['name'],
            description: doc['description'],
            level: doc['level'],
            muscles: List.from(doc['muscles']).map((e) => e.toString()).toList(),
            caloriesBurnedPerUnit: doc['caloriesBurnedPerUnit'],
            caloriesUnit: doc['caloriesUnit'],
            type: doc['type'],
            durationUnit: doc['durationUnit']
        );
      }
      // print('GetDBEnd: $result');
      return result;
    } catch(e) {
      print('getDBExercises: ${e.toString()}');
      return {};
    }
  }


  // Get Database Food
  Future<Map<String, DBFoodEntry>> getDBFood() async {
    try {
      final QuerySnapshot<Object?> snapshot = await dbFoodCollection.get();
      Map<String, DBFoodEntry> result = {};
      for (int i = 0; i < snapshot.docs.length; i++) {
        final doc = snapshot.docs[i];
        // print('Tester: ${snapshot.docs[i].id}');
        result[doc.id] = DBFoodEntry(
            did: doc.id,
            name: doc['name'],
            description: doc['description'],
            caloriesGainedPerUnit: doc['caloriesGainedPerUnit'],
            caloriesUnit: doc['caloriesUnit'],
            servingUnit: doc['servingUnit']
        );
      }
      // print('GetDBEnd: $result');
      return result;
    } catch(e) {
      print('getDBExercises: ${e.toString()}');
      return {};
    }
  }
}