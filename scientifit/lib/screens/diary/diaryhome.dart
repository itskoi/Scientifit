import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/templates.dart';

class DiaryHome extends StatefulWidget {

  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  DateTime _date = DateTime.now();
  String _dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  int consumed = 0;
  int burned = 0;
  double balance = 0;

  List<FoodEntry> _foodEntries = [];
  List<ExerciseEntry> _exEntries = [];

  Future<String> _calculation() async {
    global.dbFood = await global.databaseService!.getDBFood();
    global.dbExercise = await global.databaseService!.getDBExercises();
    return 'Data loaded';
  }

  void _initialize() {
    balance = 0;
    burned = 0;
    consumed = 0;

    _foodEntries = global.currentUser!.getFoodsWithDate(_dateString);
    _exEntries = global.currentUser!.getExercisesWithDate(_dateString);

    _exEntries.forEach((element) => burned += element.caloriesBurned);
    _foodEntries.forEach((element) => consumed += element.caloriesGained);

    if (global.currentUser!.gender == true) {
      // Male
      balance = (66.5 + 13.8 * global.currentUser!.weight + 5 * global.currentUser!.height) / (8.8 * global.currentUser!.age);
    } else {
      // Female
      balance = (655.1 + 9.6 * global.currentUser!.weight + 1.9 * global.currentUser!.height) / (4.7 * global.currentUser!.age);
    }

    balance += consumed;
    balance -= burned;
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : StreamBuilder<ScientifitUser>(
      stream: global.databaseService!.userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          global.currentUser = snapshot.data;
          print('Changed from user!');
          _initialize();
        } else {
          _exEntries = [];
          _foodEntries = [];
          balance = 0;
          burned = 0;
          consumed = 0;
        }
        return Scaffold(
          backgroundColor: Color(0xFFFCFFF8),
          appBar: AppBar(
            backgroundColor: Color(0xFFFCFFF8),
            elevation: 0.0,
            title: Row(
              children: [
                Text(
                  'Diary',
                  style: TextStyle(
                      color: Color(0xFF2B463C),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 36),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(
                    Icons.book,
                    color: Color(0xFF2B463C),
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 10.0,
            color: Color(0xFF2B463C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.book,
                    color: Color(0xFFDDFFAC),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.public, color: Color(0xFFDDFFAC), size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.equalizer, color: Color(0xFFDDFFAC), size: 30),
                ),
                IconButton(
                  onPressed: () async {
                    await Navigator.pushReplacementNamed(context, '/profile');
                  },
                  icon: Icon(Icons.account_circle_outlined,
                      color: Color(0xFFDDFFAC), size: 30),
                ),
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
            direction: SpeedDialDirection.Up,
            icon: Icons.create,
            backgroundColor: Color(0xFF2B463C),
            activeBackgroundColor: Color(0xFF688F4E),
            spaceBetweenChildren: 10,
            elevation: 5.0,
            children: [
              SpeedDialChild(
                  onTap: () async {
                    global.dbFood = await global.databaseService!.getDBFood();
                    await Navigator.pushNamed(context, '/food');
                  },
                  child: Icon(Icons.restaurant_menu),
                  label: 'Food',
                  labelStyle: TextStyle(color: Colors.white),
                  labelBackgroundColor: Color(0xFFBC2057),
                  backgroundColor: Color(0xFFBC2057),
                  foregroundColor: Color(0xFFFFD89C)),
              SpeedDialChild(
                  onTap: () async {
                    global.dbExercise = await global.databaseService!.getDBExercises();
                    await Navigator.pushNamed(context, '/exercise');
                  },
                  child: Icon(Icons.directions_run),
                  label: 'Exercise',
                  labelStyle: TextStyle(color: Colors.white),
                  labelBackgroundColor: Color(0xFF2B463C),
                  backgroundColor: Color(0xFF2B463C),
                  foregroundColor: Color(0xFFFFD89C)),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 150,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'BURNED',
                                    style: TextStyle(
                                        color: Color(0xFF688F4E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Text(
                                    burned.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Text(
                                    'kcal',
                                    style: TextStyle(
                                        color: Color(0xFFA6A6A6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    height: 5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          tileMode: TileMode.repeated,
                                          colors: [
                                            Color(0xFFBE15A3),
                                            Color(0xFFDD8600),
                                            Color(0xFF00E2AC)
                                          ],
                                          stops: [
                                            0.4,
                                            0.7,
                                            1
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 150,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'CONSUMED',
                                    style: TextStyle(
                                        color: Color(0xFF688F4E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Text(
                                    consumed.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Text(
                                    'kcal',
                                    style: TextStyle(
                                        color: Color(0xFFA6A6A6),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    height: 5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          tileMode: TileMode.repeated,
                                          colors: [
                                            Color(0xFF432CCC),
                                            Color(0xFFDB0808),
                                            Color(0xFF38D800)
                                          ],
                                          stops: [
                                            0.4,
                                            0.7,
                                            1
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          Container(
                              height: 70,
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: TextButton(
                                  onPressed: () async {
                                    final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2017, 1),
                                      lastDate: DateTime(2022, 7),
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        _date = pickedDate;
                                        _dateString =
                                            DateFormat('yyyy-MM-dd').format(_date);

                                        _initialize();
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        DateFormat('E', 'en_US').format(_date),
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Color(0xFFBC2057)),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                      ),
                                      Text(
                                        DateFormat('LLL d', 'en_US').format(_date),
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 220,
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'BALANCE',
                                      style: TextStyle(
                                          color: Color(0xFF688F4E),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Text(
                                      balance.round().toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Text(
                                      'kcal',
                                      style: TextStyle(
                                          color: Color(0xFFA6A6A6),
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'DETAILS',
                                          style: TextStyle(
                                              color: Color(0xFF2B463C),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'OpenSans'),
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DragTarget<FoodEntry>(
                builder: (_, __, ___) => DragTarget<ExerciseEntry>(
                  builder: (_, __, ___) => Container(
                    padding: EdgeInsets.all(25),
                    height: 620,
                    child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Color(0xFF2B463C), width: 3.0)),
                        /* TODO: DIARY CARD */
                        child: FutureBuilder<String>(
                          future: _calculation(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                                itemCount: _foodEntries.length + _exEntries.length,
                                padding: const EdgeInsets.all(15),
                                itemBuilder: (context, index) {
                                  if (index < _foodEntries.length)
                                    return FoodCard(food: _foodEntries[index]);
                                  return ExerciseCard(exercise: _exEntries[index - _foodEntries.length]);
                                },
                              );
                            } else {
                              return Loading();
                            }
                          }
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
