import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scientifit/models/account.dart';

class DatabaseService {

  DatabaseService( {required this.uid} );

  final String uid;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');


  // Update user's data
  Future updateUserDate(String username, String email) async {
    return await userCollection.doc(uid).set({
      'username' : username,
      'email' : email
    }).then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Get user stream
  Account _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Account(
        uid: uid,
        username: snapshot['username'] ,
        email: snapshot['email']
    );
  }

  Stream<Account> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}