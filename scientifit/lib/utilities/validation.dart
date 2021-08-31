String? ValidateEmail(String? str) {
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(str!))
    return 'Please enter a valid email';
  return str.trim().isEmpty ? 'Enter an email' : null;
}

String? ValidatePassword(String? str) {
  if(RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(str!))
    return 'Please enter a valid password';
  return (str.length < 6) ? 'Enter a pwd 6+ chars long' : null;
}

String? ValidateUsername(String? str) {
  if(RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(str!))
    return 'Please enter a valid username';
  if (str.trim().length < 4)
    return 'Username must be at least 4 characters in length';
  return str.trim().isEmpty ? 'Enter an username' : null;
}

String? ValidateSearch(String? str) {
  if(RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(str!))
    return 'Please enter a valid exercise name';
  return str.trim().isEmpty ? 'Enter an exercise name for searching' : null;
}

String ValidateSignIn(String str) {
  if (str.contains('user-not-found'))
    return 'There is no user corresponding to the given email';
  if (str.contains('invalid-email'))
    return 'The email address is not valid';
  if (str.contains('user-disabled'))
    return 'The user corresponding to the given email has been disabled.';
  if (str.contains('wrong-password'))
    return 'The password is invalid for the given email';
  return 'Can not connect to the server';
}
String ValidateSignUp(String str) {
  if (str.contains('email-already-in-use'))
    return 'There already exists an account with the given email address';
  if (str.contains('invalid-email'))
    return 'The email address is not valid';
  if (str.contains('operation-not-allowed'))
    return 'Email/password accounts are not enabled';
  if (str.contains('weak-password'))
    return 'The password is not strong enough';
  return 'Can not connect to the server';
}