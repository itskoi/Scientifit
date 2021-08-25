import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientifit/models/account.dart';
import 'package:scientifit/screens/authentication/authmain.dart';
import 'package:scientifit/screens/diary/diaryhome.dart';

class Coordinator extends StatelessWidget {
  const Coordinator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Account?>(context);
    if (user!=null) {
      print('Coordinator: ${user.toString()}');
    }
    return user == null ? AuthMain() : DiaryHome();
  }
}
