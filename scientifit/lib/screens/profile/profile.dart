import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/services/authservice.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/templates.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  final _authService = AuthService();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return loading
        ? Loading()
        : StreamBuilder<ScientifitUser>(
            stream: global.currentAccount == null ? null : DatabaseService(uid: global.currentAccount!.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ScientifitUser? userData = snapshot.data;
                global.currentUser = snapshot.data;
              }

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
                          print('Test route: ${ModalRoute.of(context)!.settings.name}');
                        },
                        icon: Icon(Icons.exit_to_app),
                        label: Text('Sign out')),
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('assets/images/avatar.jpg'),
                            radius: 40,
                          ),
                          Column(children: [
                            Text(
                              (global.currentUser == null ? 'None' : global.currentUser!.username),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'OpenSans'),
                            ),
                            Text(
                              'Joined on June 2021',
                              style: TextStyle(
                                  color: Color(0xFFA6A6A6),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'OpenSans'),
                            ),
                          ]),
                          IconButton(
                            onPressed: () {},
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 10,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'HEIGHT',
                                          style: TextStyle(
                                              color: Color(0xFF688F4E),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'OpenSans'),
                                        ),
                                        Text(
                                          (global.currentUser == null ? 'None' : global.currentUser!.height.toString()),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 10,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'WEIGHT',
                                          style: TextStyle(
                                              color: Color(0xFF688F4E),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'OpenSans'),
                                        ),
                                        Text(
                                          (global.currentUser == null ? 'None' : global.currentUser!.weight.toString()),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
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
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'BLOGS',
                                            style: TextStyle(
                                                color: Color(0xFF688F4E),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'OpenSans'),
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text('51',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 30,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontFamily:
                                                        'OpenSans',
                                                      )),
                                                ),
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
                                                  color: Colors.amber,
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
                                                  color: Colors.green,
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
                          child: GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BADGE',
                                        style: TextStyle(
                                            color: Color(0xFF688F4E),
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.assignment_turned_in,
                                        color: Colors.amber,
                                        size: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '50 blogs',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'OpenSans',
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                    )
                  ],
                ),
              );
            });
  }
}
