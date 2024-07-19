import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_cloud_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseCloudService _cloudService = FirebaseCloudService();

// CURRENT USER
  User? get currentUser => _firebaseAuth.currentUser;

// AUTH STATE CHANGE LISTENER
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

// LOGIN WITH EMAIL AND PASSWORD METHOD
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _cloudService.mergeUsersInfo(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// CREATE A NEW USER WITH EMAIL AND PASSWORD METHOD
  Future<UserCredential> createNewUser(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _cloudService.saveUsersIntoFireStore(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// SIGN OUT METHOD
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
