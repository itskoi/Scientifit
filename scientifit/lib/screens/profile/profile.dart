import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/services/authservice.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/templates.dart';

class Profile extends StatefulWidget {
  final _authService = AuthService();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  DateTime _createdDate = DateTime.now();

  int _height = 0;
  int _weight = 0;
  bool _sex = true; // true: male ; false: female

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : StreamBuilder<ScientifitUser>(
            stream: global.currentAccount == null
                ? null
                : DatabaseService(uid: global.currentAccount!.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                global.currentUser = snapshot.data;
                _createdDate =
                    global.currentAccount!.metadata.creationTime as DateTime;
                _height = global.currentUser!.height;
                _weight = global.currentUser!.weight;
                _sex = global.currentUser!.gender;
                return Scaffold(
                  backgroundColor: Color(0xFFFCFFF8),
                  appBar: AppBar(
                    backgroundColor: Color(0xFFFCFFF8),
                    elevation: 0.0,
                    actions: [
                      TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          Navigator.popAndPushNamed(context, '/');
                          await widget._authService.signOut();
                          setState(() {
                            loading = false;
                          });
                          print(
                              'Test route: ${ModalRoute.of(context)!.settings.name}');
                        },
                        icon: Icon(Icons.exit_to_app),
                        label: Text('Sign out'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Color(0xFF2B463C)),
                        ),
                      ),
                    ],
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Color(0xFF2B463C),
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 36),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Icon(
                            Icons.account_circle,
                            color: Color(0xFF2B463C),
                            size: 35,
                          ),
                        ),
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
                          onPressed: () async {
                            await Navigator.pushReplacementNamed(
                                context, '/diary');
                          },
                          icon: Icon(
                            Icons.book,
                            color: Color(0xFFDDFFAC),
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.public,
                              color: Color(0xFFDDFFAC), size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.equalizer,
                              color: Color(0xFFDDFFAC), size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_circle_outlined,
                              color: Color(0xFFDDFFAC), size: 30),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endFloat,
                  body: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.jpg'),
                              radius: 40,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (global.currentUser == null
                                        ? 'None'
                                        : global.currentUser!.username),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'OpenSans',
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  Text(
                                    'Joined on ${DateFormat('LLL y', 'en_US').format(_createdDate)}',
                                    style: TextStyle(
                                        color: Color(0xFFA6A6A6),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ]),
                            IconButton(
                              onPressed: () {
                                showDialog<void>(
                                    context: context,
                                    builder: (context) => StatefulBuilder(
                                            builder: (context, setState) {
                                          return SimpleDialog(
                                            title: Text(
                                              'Edit Biometric',
                                              style: TextStyle(
                                                color: Color(0xFF2B463C),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'OpenSans',
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            children: [
                                              Divider(
                                                thickness: 2,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Sex',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Center(
                                                child: DropdownButton(
                                                  value: _sex,
                                                  items: [
                                                    DropdownMenuItem(
                                                      value: true,
                                                      child: Text(
                                                        'Male',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF688F4E),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily:
                                                              'OpenSans',
                                                        ),
                                                      ),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: false,
                                                      child: Text(
                                                          'Female',
                                                        style: TextStyle(
                                                          color:
                                                          Color(0xFF688F4E),
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontFamily:
                                                          'OpenSans',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  onChanged: (bool? val) {
                                                    setState(() {
                                                      _sex = val!;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'Height',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                _height -= 1;
                                                                if (_height < 0)
                                                                  _height = 1;
                                                              });
                                                            },
                                                            icon: Icon(Icons
                                                                .remove_circle_outline)),
                                                        Text(
                                                          _height.toString(),
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF688F4E),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'OpenSans',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                _height += 1;
                                                                if (_height > 250)
                                                                  _height = 250;
                                                              });
                                                            },
                                                            icon: Icon(Icons
                                                                .add_circle_outline_outlined))
                                                      ])),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _weight -= 1;
                                                              if (_weight < 0)
                                                                _weight = 1;
                                                            });
                                                          },
                                                          icon: Icon(Icons
                                                              .remove_circle_outline)),
                                                      Text(
                                                        _weight.toString(),
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF688F4E),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily:
                                                              'OpenSans',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _weight += 1;
                                                              if (_weight > 300)
                                                                _weight = 300;
                                                            });
                                                          },
                                                          icon: Icon(Icons
                                                              .add_circle_outline_outlined))
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                thickness: 2,
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await global.databaseService!.updateBiometric(height: _height, weight: _weight, gender: _sex);
                                                  _height = await global.currentUser!.height;
                                                  _weight = await global.currentUser!.weight;
                                                  _sex = await global.currentUser!.gender;
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Color(0xFFBC2057),
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'OpenSans',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          );
                                        }));
                              },
                              icon: Icon(
                                Icons.app_registration,
                                size: 25,
                                color: Colors.grey[300],
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.all(15),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Color(0xFF2B463C),
                                              width: 3.0)),
                                      elevation: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'HEIGHT',
                                            style: TextStyle(
                                                color: Color(0xFF2B463C),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          Text(
                                            (global.currentUser == null
                                                ? 'None'
                                                : global.currentUser!.height
                                                    .toString()),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 35,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          Text(
                                            'cm',
                                            style: TextStyle(
                                                color: Color(0xFFA6A6A6),
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'OpenSans'),
                                          ),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Color(0xFF2B463C),
                                              width: 3.0)),
                                      elevation: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'WEIGHT',
                                            style: TextStyle(
                                                color: Color(0xFF2B463C),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          Text(
                                            (global.currentUser == null
                                                ? 'None'
                                                : global.currentUser!.weight
                                                    .toString()),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 35,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Color(0xFFA6A6A6),
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'OpenSans'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 8,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 300,
                                      width: double.infinity,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide(
                                                color: Color(0xFF2B463C),
                                                width: 3.0)),
                                        elevation: 10,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'BLOGS',
                                              style: TextStyle(
                                                  color: Color(0xFF2B463C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'OpenSans'),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('51',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'OpenSans',
                                                      )),
                                                  Text(
                                                    'blogs',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFA6A6A6),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: 'OpenSans'),
                                                  ),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    color: Colors.pink,
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    '861',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.comment,
                                                    color: Color(0xFFDD8600),
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    '452',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.share,
                                                    color: Color(0xFF2B463C),
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    '67',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ]),
                                            Divider(
                                              thickness: 1,
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'MANAGE',
                                                  style: TextStyle(
                                                      color: Color(0xFF2B463C),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                side: BorderSide(
                                    color: Color(0xFF2B463C), width: 3.0)),

                            /* TODO: DIARY CARD */
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'BADGES',
                                  style: TextStyle(
                                      color: Color(0xFF2B463C),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'OpenSans'),
                                ),
                                Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemCount: 20,
                                      padding: const EdgeInsets.all(15),
                                      itemBuilder: (context, index) => Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.military_tech_rounded,
                                                    color: Color(0xFFBC2057),
                                                    size: 45,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '50 blogs',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFA6A6A6),
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                );
              } else
                return Loading();
            });
  }
}
