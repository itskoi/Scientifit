import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scientifit/services/authservice.dart';
import 'package:scientifit/utilities/templates.dart';
import 'package:scientifit/utilities/validation.dart';

class SignIn extends StatefulWidget {
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = '';
  String error = '';

  bool _hidePassword = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF2B463C),),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Form(
        key: widget._formKey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Color(0xFF2B463C),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 36.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  color: Color(0xFF688F4E),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                onChanged: (str) {
                  setState(() {
                    email = str;
                  });
                },
                validator: ValidateEmail,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 25,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7A4E09)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (str) {
                  setState(() {
                    password = str;
                  });
                },
                validator: ValidatePassword,
                obscureText: _hidePassword,
                style: TextStyle(
                  color: Color(0xFF2B463C),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.black,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _hidePassword = !_hidePassword);
                    },
                    icon: Icon(
                      _hidePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7A4E09)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget._formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      var result = await widget._authService.signInWithEmailAndPassword(email, password);
                      setState(() {
                        loading = false;
                      });
                      if (result is User) {
                        Navigator.of(context).pop();
                      } else {
                        var code = result.toString();
                        setState(() {
                          error = ValidateSignIn(code);
                        });
                      }
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFFDDFFAC),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2B463C), fixedSize: Size(224, 48)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF688F4E)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2B463C)),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
