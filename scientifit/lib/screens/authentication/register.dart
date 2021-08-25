import 'package:flutter/material.dart';
import 'package:scientifit/services/authservice.dart';
import 'package:scientifit/utilities/validation.dart';

class Register extends StatefulWidget {
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _hidePassword = true;
  bool _acceptTermsAndConditions = true;

  String username = '';
  String email = '';
  String password = '';
  String error = '';

  Color getColor(Set<MaterialState> states) {
    return Color(0xFF2B463C);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Hi!',
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
                'Create a new account',
                style: TextStyle(
                  color: Color(0xFF688F4E),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (str) {
                  setState(() {
                    username = str;
                  });
                },
                validator: ValidateUsername,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Username',
                  icon: Icon(
                    Icons.person,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _acceptTermsAndConditions,
                    onChanged: (val) {
                      setState(() {
                        _acceptTermsAndConditions = val!;
                      });
                    },
                    checkColor: Color(0xFFDDFFAC),
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                  ),
                  Text(
                    'I agree to',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' Terms and Conditions',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
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
                height: 70,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget._formKey.currentState!.validate()) {
                      if (_acceptTermsAndConditions) {
                        var result = await widget._authService.createUserWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Can\'t not create the account';
                          });
                        }
                      } else {
                        setState(() {
                          error = 'Please agree to all the Terms and Conditions';
                        });
                      }
                    }
                  },
                  child: Text(
                    'SIGN UP',
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
                        'Already have an account?',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF688F4E)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/signin');
                          },
                          child: Text(
                            'Sign in',
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
