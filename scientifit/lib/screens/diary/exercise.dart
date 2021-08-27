import 'package:flutter/material.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/singleton.dart';
import 'package:scientifit/utilities/templates.dart';
import 'package:intl/intl.dart';
import 'package:scientifit/utilities/validation.dart';

class Exercise extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  String _dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<DBExerciseEntry> searchList = global.dbExercise.values.toList();
  String searchString = '';

  DBExerciseEntry? curSelected;

  void onChoosingCard(int index) {
    setState(() {
      curSelected = searchList[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<ScientifitUser>(
      stream: DatabaseService(uid: global.currentAccount!.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          currentUser = snapshot.data;
          print(currentUser!.myExEntries);
        }
        return Scaffold(
            resizeToAvoidBottomInset: false,
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
                'Exercise',
                style: TextStyle(
                    color: Color(0xFF2B463C),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ClipRRect(
                      child: Image.asset(
                          'assets/images/exercises.gif'),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      'Add your new exercise by tapping on it!',
                      style: TextStyle(
                        color: Color(0xFF2B463C),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: widget._formKey,
                      child: TextFormField(
                        validator: ValidateSearch,
                        onChanged: (str) {
                          setState(() {
                            searchString = str;
                          });
                        },
                        initialValue: 'Search...',
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:
                                const BorderSide(color: Color(0xFF2B463C), width: 2.0),
                          ),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.green[800],
                            onPressed: () {
                              print('push');
                              if(searchString.isEmpty) {
                                setState(() {
                                  searchList = global.dbExercise.values.toList();
                                });
                              } else if (widget._formKey.currentState!.validate()) {
                                List<DBExerciseEntry> newSearchList = [];
                                global.dbExercise.values.forEach((e) {
                                  if (e.name.toLowerCase().contains(searchString.toLowerCase())) {
                                    newSearchList.add(e);
                                  }
                                });
                                setState(() {
                                  searchList = newSearchList;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 620,
                      color: Colors.white,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                            itemCount: searchList.length,
                            itemBuilder: (context, index) {
                              Color colorLevel = Color(0xFF688F4E);
                              if (searchList[index].level == 'Intermediate')
                                colorLevel = Color(0xFFDD8600);
                              if (searchList[index].level == 'Advanced')
                                colorLevel = Color(0xFFBC2057);
                              return InkWell(
                                onTap: () async {
                                  await Navigator.pushNamed(
                                      context, '/addexercise',
                                      arguments: searchList[index]
                                  );
                                },
                                child: Card(
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
                                            width: 180,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  searchList[index].name,
                                                  style: TextStyle(
                                                      color: Color(0xFF2B463C),
                                                      fontFamily: 'OpenSans',
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  searchList[index].level,
                                                  style: TextStyle(
                                                      color: colorLevel,
                                                      fontFamily: 'OpenSans',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                searchList[index].caloriesBurnedPerUnit.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                searchList[index].caloriesUnit + ' / ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15
                                                ),
                                              ),
                                              Text(
                                                searchList[index].durationUnit,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      }
    );
  }
}
