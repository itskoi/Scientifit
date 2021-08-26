import 'package:flutter/material.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/utilities/templates.dart';
import 'package:intl/intl.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  String _dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
          title: Row(
            children: [
              Text(
                'Exercise',
                style: TextStyle(
                    color: Color(0xFF2B463C),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_box_outlined),
                    label: Text('Create your own'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Color(0xFF2B463C)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                child: TextFormField(
                  initialValue: 'Search...',
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[600],
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
                        itemCount: global.currentUser!.countExercises(_dateString),
                        itemBuilder: (context, index) => ExerciseCard2(exercise: global.currentUser!.getExercise(_dateString, index),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
