import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:flutter/material.dart';
import 'package:scientifit/utilities/singleton.dart' as global;

class ExerciseCard extends StatefulWidget {
  ExerciseCard({required this.exercise});

  final ExerciseEntry exercise;

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<ExerciseEntry>(
      onDraggableCanceled: (_, __) async {
        await global.databaseService!.removeExerciseFromDiary(widget.exercise);
        print('Remove exercise: ${global.dbExercise[widget.exercise.did]!.name}!');
      },
      data: widget.exercise,
      feedback: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white.withAlpha(200),
          child: SizedBox(
            width: 150,
            height: 150,
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
                        fontSize: 18),
                  ),
                  Container(
                    height: 60,
                    child: Text(
                      global.dbExercise[widget.exercise.did]!.name,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.exercise.caloriesBurned.toString(),
                        style: TextStyle(
                            color: Color(0xFFDD8600),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        global.dbExercise[widget.exercise.did]!.caloriesUnit,
                        style: TextStyle(
                            color: Color(0xFFF9B751),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      child: Card(
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
                      fontSize: 18),
                ),
                Container(
                  height: 60,
                  child: Text(
                    global.dbExercise[widget.exercise.did]!.name,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.exercise.caloriesBurned.toString(),
                      style: TextStyle(
                          color: Color(0xFFDD8600),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      global.dbExercise[widget.exercise.did]!.caloriesUnit,
                      style: TextStyle(
                          color: Color(0xFFF9B751),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class FoodCard extends StatefulWidget {
  FoodCard({required this.food});

  final FoodEntry food;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<FoodEntry>(
      onDraggableCanceled: (_, __) async {
        await global.databaseService!.removeFoodFromDiary(widget.food);
        print('Remove food: ${global.dbFood[widget.food.did]!.name}!');
      },
      data: widget.food,
      feedback: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white.withAlpha(200),
          child: SizedBox(
            height: 150,
            width: 150,
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
                        fontSize: 18),
                  ),
                  Container(
                    height: 70,
                    child: Text(
                      global.dbFood[widget.food.did]!.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.food.caloriesGained.toString(),
                        style: TextStyle(
                            color: Color(0xFFDD8600),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        global.dbFood[widget.food.did]!.caloriesUnit,
                        style: TextStyle(
                            color: Color(0xFFF9B751),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
      child: Card(
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
                      fontSize: 18),
                ),
                Container(
                  height: 70,
                  child: Text(
                    global.dbFood[widget.food.did]!.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.food.caloriesGained.toString(),
                      style: TextStyle(
                          color: Color(0xFFDD8600),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      global.dbFood[widget.food.did]!.caloriesUnit,
                      style: TextStyle(
                          color: Color(0xFFF9B751),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
