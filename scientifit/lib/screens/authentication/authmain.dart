import 'dart:ui';

import 'package:flutter/material.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 30, 25, 40),
        child: Column(
          children: [
            Image.asset('assets/images/AuthImage.png'),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello!',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2B463C)),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'From the outside, it was a wonder that he was able to get up so early each morning for someone who had absolutely no plans to be productive during the entire day.',
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF2B463C)),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/signin');
              },
              child: Text(
                'LOG IN',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFDDFFAC)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2B463C), fixedSize: Size(224, 48)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2B463C)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDDFFAC), fixedSize: Size(224, 48)),
            ),
          ],
        ),
      ),
    );
  }
}
