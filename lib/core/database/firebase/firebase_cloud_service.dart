import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  // STORE USERS INSIDE FIRESTORE DATABASE
  Future<void> saveUsersIntoFireStore(UserCredential user, String email) async {
    final users = userCollection.doc(user.user!.uid,).set(
      {
        'uid': user.user!.uid,
        'email': email,
      },
    );

    return users;
  }

// MERGE USERS INSIDE FIRESTORE DATABASE TO AVOID DUPLICATING
  Future<void> mergeUsersInfo(UserCredential user, String email) async {
    final users = userCollection.doc(user.user!.uid).set(
      {
        'uid': user.user!.uid,
        'email': email,
      },
      SetOptions(
        merge: true,
      ),
    );
    return users;
  }

// Delete Users From FireStore Database

  Future<void> deleteUserFromFireStore(UserCredential user) async {
    final users = userCollection.doc(user.user!.uid).delete();
    return users;
  }

// Display User by their name
  Future<void> displayUsers(UserCredential user) =>
      userCollection.doc(user.user!.displayName).get();
}
