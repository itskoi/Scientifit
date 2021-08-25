import 'package:firebase_auth/firebase_auth.dart';
import 'package:scientifit/models/account.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  // Get Account from UserCredential
  Account? _getAccountFromUser(User? user) {
    return user == null ? null : Account(uid: user.uid);
  }

  // Account stream
  Stream<Account?> get user => _auth.authStateChanges().map(_getAccountFromUser);

  // Register with Email & Password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _getAccountFromUser(user);
    }
    catch (e) {
      print('AuthService > Sign up: $e');
      return null;
    }
  }

  // Sign in with Email & Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print(user!.email);
      return _getAccountFromUser(user);
    }
    catch (e) {
      print('AuthService > Sign in: $e');
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      var result = await _auth.signOut();
    }
    catch(e) {
      print('AuthService > Sign out: $e');
    }
  }
}