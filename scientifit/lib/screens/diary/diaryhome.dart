import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scientifit/services/authservice.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DiaryHome extends StatefulWidget {
  final _authService = AuthService();

  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
              child: Icon(Icons.restaurant_menu),
              label: 'Food',
              labelStyle: TextStyle(color: Colors.white),
              labelBackgroundColor: Color(0xFFBC2057),
              backgroundColor: Color(0xFFBC2057),
              foregroundColor: Color(0xFFFFD89C)),
          SpeedDialChild(
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
                                '1350',
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
                                '905',
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
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2017, 1),
                                  lastDate: DateTime(2022, 7),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Sar',
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
                                    'Aug 26',
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
                                  '172',
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
          Container(
            padding: EdgeInsets.all(25),
            height: 620,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFF2B463C), width: 3.0)
              ),
              /* TODO: DIARY CARD */
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: 20,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) => Card(
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
                            'Phở',
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
                                '350',
                                style: TextStyle(
                                    color: Color(0xFFDD8600),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                'kcal',
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
                  )
              )
            ),
          )
        ],
      ),
    );
  }
}
