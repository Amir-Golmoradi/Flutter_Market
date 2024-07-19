import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_cloud_service.dart';
import 'package:flutter_dunimarket/core/error/exception.dart';
import 'package:flutter_dunimarket/core/error/failure_message.dart';

final firebaseAuth = FirebaseAuth.instance;
final cloudService = FirebaseCloudService();

abstract class AuthenticationIntent extends Equatable {
  @override
  List<Object?> get props => [firebaseAuth, cloudService];
}

class AuthStateProvider extends AuthenticationIntent {
  Stream<User?> get user => firebaseAuth.authStateChanges();
}

class SignUpRequest extends AuthenticationIntent {
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cloudService.saveUsersIntoFireStore(newUser, email);

      return newUser;
    } on ServerException catch (e) {
      Failure(e.toString());
      rethrow;
    }
  }
}

class LoginRequest extends AuthenticationIntent {
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userLogin = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await cloudService.mergeUsersInfo(userLogin, email);

      return userLogin;
    } on ServerException catch (e) {
      Failure(e.toString());
      rethrow;
    }
  }
}

class LogoutRequest extends AuthenticationIntent {
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}

class ForgotPassword extends AuthenticationIntent {
  ForgotPassword({required this.email});
  final String email;
  @override
  List<Object?> get props => [email];
}

class ResetPassword extends AuthenticationIntent {
  Future<void> resetPassword(String resetPasswordEmail) async {
    await firebaseAuth.sendPasswordResetEmail(
      email: resetPasswordEmail,
    );
  }
}
