import 'package:flutter/material.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/scientifituser.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/singleton.dart';
import 'package:intl/intl.dart';
import 'package:scientifit/utilities/validation.dart';

class Food extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  String _dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<DBFoodEntry> searchList = global.dbFood.values.toList();
  String searchString = '';

  DBFoodEntry? curSelected;

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
            print(currentUser!.myFoodEntries);
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
                  'Food',
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
                            'assets/images/meal.gif'),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        'Add your new meal by tapping on it!',
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
                                    searchList = global.dbFood.values.toList();
                                  });
                                } else if (widget._formKey.currentState!.validate()) {
                                  List<DBFoodEntry> newSearchList = [];
                                  global.dbFood.values.forEach((e) {
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
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.pushNamed(
                                        context, '/addfood',
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
                                              child: Text(
                                                searchList[index].name,
                                                style: TextStyle(
                                                    color: Color(0xFF2B463C),
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  searchList[index].caloriesGainedPerUnit.toString(),
                                                  style: TextStyle(
                                                      color: Color(0xFF7A4E09),
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
                                                  searchList[index].servingUnit,
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
