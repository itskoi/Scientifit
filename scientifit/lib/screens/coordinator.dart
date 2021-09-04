import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientifit/screens/authentication/authmain.dart';
import 'package:scientifit/screens/diary/diaryhome.dart';
import 'package:scientifit/services/databaseservice.dart';
import 'package:scientifit/utilities/singleton.dart' as global;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scientifit/screens/onboarding/onboarding.dart';

class Coordinator extends StatelessWidget {
  const Coordinator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final account = Provider.of<User?>(context);
    if (account!=null) {
      global.currentAccount = account;
      global.databaseService = DatabaseService(uid: account.uid);
      print('Coordinator: Welcome to Scientifit <${account.email}>');
    }
    return account == null ? OnBoarding() : DiaryHome();
  }
}
