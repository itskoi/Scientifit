import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
              Text(
                exercise.name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 30
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
                    exercise.getCaloriesUnit(),
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
              Text(
                food.name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 30
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
                    food.getCaloriesUnit(),
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

class ExerciseCard2 extends StatelessWidget {

  ExerciseCard2( { required this.exercise });

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
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          exercise.duration.toString(),
                          style: TextStyle(
                              color: Color(0xFFDD8600),
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          exercise.getDurationUnit(),
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
              ),
              SizedBox(width: 150,),
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
                exercise.getCaloriesUnit(),
                style: TextStyle(
                    color: Color(0xFFF9B751),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                ),
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
