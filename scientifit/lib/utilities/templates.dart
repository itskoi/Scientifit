import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:flutter/material.dart';
import 'package:scientifit/utilities/singleton.dart' as global;

class ExerciseCard extends StatelessWidget {

  ExerciseCard( { required this.exercise });

  final ExerciseEntry exercise;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EXERCISE',
                style: TextStyle(
                    color: Color(0xFF2B463C),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                ),
              ),
              Container(
                height: 60,
                child: Text(
                  global.dbExercise[exercise.did]!.name,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    exercise.caloriesBurned.toString(),
                    style: TextStyle(
                        color: Color(0xFFDD8600),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    global.dbExercise[exercise.did]!.caloriesUnit,
                    style: TextStyle(
                        color: Color(0xFFF9B751),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
class FoodCard extends StatelessWidget {

  FoodCard( { required this.food });

  final FoodEntry food;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FOOD',
                style: TextStyle(
                    color: Color(0xFFBC2057),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                ),
              ),
              Container(
                height: 70,
                child: Text(
                  global.dbFood[food.did]!.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    food.caloriesGained.toString(),
                    style: TextStyle(
                        color: Color(0xFFDD8600),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    global.dbFood[food.did]!.caloriesUnit,
                    style: TextStyle(
                        color: Color(0xFFF9B751),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xFF2B463C),
          size: 50,
        ),
      ),
    );
  }
}
