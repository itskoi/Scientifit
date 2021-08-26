import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scientifit/models/account.dart';
import 'package:scientifit/screens/authentication/authmain.dart';
import 'package:scientifit/screens/diary/diaryhome.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:scientifit/models/diaryentry.dart';

class Coordinator extends StatelessWidget {
  const Coordinator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Account?>(context);
    if (user!=null) {
      global.currentUser = user;

      global.currentUser!.addExercise(DateFormat('yyyy-MM-dd').format(DateTime.now()), pushup);
      global.currentUser!.addExercise(DateFormat('yyyy-MM-dd').format(DateTime.now()), pullup);
      global.currentUser!.addFood(DateFormat('yyyy-MM-dd').format(DateTime.now()), pho);
      global.currentUser!.addFood(DateFormat('yyyy-MM-dd').format(DateTime.now()), pizza);
      global.currentUser!.addFood(DateFormat('yyyy-MM-dd').format(DateTime.now()), bunbo);

      print('Coordinator: ${user.toString()}');
    }
    return user == null ? AuthMain() : DiaryHome();
  }
}
