import 'package:firebase_auth/firebase_auth.dart';
import 'package:scientifit/services/databaseservice.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  // Account stream
  Stream<User?> get user => _auth.authStateChanges();

  // Register with Email & Password
  Future createUserWithEmailAndPassword(String username, String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).addNewUser(email: email, username: username);

      return user;
    }
    catch (e) {
      print('AuthService > Sign up: ${e}');
      return e;
    }
  }

  // Sign in with Email & Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print(user!.email);
      return user;
    }
    catch (e) {
      print('AuthService > Sign in: $e');
      return e;
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