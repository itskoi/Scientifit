import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scientifit/models/databaseentry.dart';
import 'package:scientifit/models/diaryentry.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;

class AddFood extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override

  int serving = 1;
  String error = '';

  Widget build(BuildContext context) {

    final food = ModalRoute.of(context)!.settings.arguments as DBFoodEntry;

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
          'Add a Meal',
          style: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await DatabaseService(uid: global.currentAccount!.uid).addFoodToDiary(FoodEntry(
                    did: food.did,
                    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    caloriesGained: serving * food.caloriesGainedPerUnit,
                    servingSize: serving
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
            Image.asset('assets/images/addmeal.gif', scale: 0.7,),
            SizedBox(height: 80,),
            Text(
              'Food details',
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
                  food.name,
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
                  'Serving',
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
                                  serving = int.parse(str);
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
                      food.servingUnit,
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
                  'Energy gained',
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
                      (serving * food.caloriesGainedPerUnit).toString(),
                      style: TextStyle(
                          color: Color(0xFFDD8600),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      food.caloriesUnit,
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
                      food.description,
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
