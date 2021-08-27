import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;

class AddExercise extends StatefulWidget {
  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override

  int duration = 1;
  String error = '';

  Widget build(BuildContext context) {

    final exercise = ModalRoute.of(context)!.settings.arguments as DBExerciseEntry;
    Color colorLevel = Color(0xFF688F4E);
    if (exercise.level == 'Intermediate')
      colorLevel = Color(0xFFDD8600);
    if (exercise.level == 'Advanced')
      colorLevel = Color(0xFFBC2057);

    String muscleGroups = exercise.muscles.first;
    for (int i = 1; i < exercise.muscles.length; i++) {
      muscleGroups += ', ${exercise.muscles[i]}';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF2B463C),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          'Add a Exercise',
          style: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await DatabaseService(uid: global.currentAccount!.uid).addExerciseToDiary(ExerciseEntry(
                    did: exercise.did,
                    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    caloriesBurned: exercise.caloriesBurnedPerUnit * duration,
                    duration: duration
                  )
                );
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.check,
                color: Color(0xFF2B463C),
                size: 25,
              )
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Image.asset('assets/images/exercise.gif', scale: 0.7,),
            SizedBox(height: 80,),
            Text(
              'Exercise details',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Text(
                  exercise.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Type of exercise',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Text(
                  exercise.type,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Level',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Text(
                  exercise.level,
                  style: TextStyle(
                      color: colorLevel,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Muscle groups',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Text(
                  muscleGroups,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Duration',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 27,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Form(
                        child: TextFormField(
                          onChanged: (str) {
                            setState(() {
                              if(str.isNotEmpty) {
                                if (int.tryParse(str) != null) {
                                  duration = int.parse(str);
                                  error = '';
                                }
                                else
                                  error = 'Make sure that you entered the number!';
                              } else {
                                error = 'Please enter a number';
                              }
                            });
                          },
                          initialValue: '1',
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      exercise.durationUnit,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  'Energy burned',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (duration * exercise.caloriesBurnedPerUnit).toString(),
                      style: TextStyle(
                          color: Color(0xFFDD8600),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      exercise.caloriesUnit,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Color(0xFF2B463C),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    Text(
                      exercise.description,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                error,
                style: TextStyle(
                    color: Colors.red[600],
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
