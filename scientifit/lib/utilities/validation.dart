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
  if (str!.trim().length < 4)
    return 'Username must be at least 4 characters in length';
  return str.trim().isEmpty ? 'Enter an username' : null;
}