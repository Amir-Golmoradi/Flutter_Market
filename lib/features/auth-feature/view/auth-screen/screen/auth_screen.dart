import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_auth_service.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = FirebaseAuthService();
    return StreamBuilder(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        return const LoginScreen();

        // if (snapshot.hasData) {
        //   return const Text('Welcome To Home Screen');
        // } else {
        //   return const SignUpScreen();
        // }
      },
    );
  }
}
