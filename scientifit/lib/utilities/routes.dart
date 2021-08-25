import 'package:flutter/material.dart';
import 'package:scientifit/screens/authentication/authmain.dart';
import 'package:scientifit/screens/authentication/register.dart';
import 'package:scientifit/screens/authentication/signin.dart';
import 'package:scientifit/screens/coordinator.dart';
import 'package:scientifit/screens/diary/diaryhome.dart';

final myRoutes = {
  '/': (context) => Coordinator(),
  '/auth': (context) => AuthMain(),
  '/signin': (context) => SignIn(),
  '/register': (context) => Register(),
  '/diary': (context) => DiaryHome()
};