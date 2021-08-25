import 'package:flutter/material.dart';
import 'package:scientifit/services/authservice.dart';

class DiaryHome extends StatefulWidget {

  final _authService = AuthService();

  @override
  _DiaryHomeState createState() => _DiaryHomeState();
}

class _DiaryHomeState extends State<DiaryHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await widget._authService.signOut();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
