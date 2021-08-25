String? ValidateEmail(String? str) {
  return str!.isEmpty ? 'Enter an email' : null;
}

String? ValidatePassword(String? str) {
  return str!.length < 6? 'Enter a pwd 6+ chars long' : null;
}

String? ValidateUsername(String? str) {
  return str!.isEmpty ? 'Enter an username' : null;
}