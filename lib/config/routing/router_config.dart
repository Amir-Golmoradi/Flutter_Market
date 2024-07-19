// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/routing/router_name.dart';
import 'package:flutter_dunimarket/config/routing/router_path.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/auth_screen.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/check_otp_screen.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/forget_password_screen.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/login_screen.dart';
import 'package:flutter_dunimarket/features/auth-feature/view/auth-screen/screen/sign_up_screen.dart';
import 'package:flutter_dunimarket/features/intro-feature/view/intro-view/intro_screen.dart';
import 'package:flutter_dunimarket/features/intro-feature/view/splash-view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouterName.splash,
        path: RouterPath.splash,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        name: RouterName.intro,
        path: RouterPath.intro,
        pageBuilder: (context, state) =>
            const MaterialPage(child: IntroScreen()),
      ),
      GoRoute(
        name: RouterName.auth,
        path: RouterPath.auth,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AuthScreen()),
      ),
      GoRoute(
        name: RouterName.login,
        path: RouterPath.login,
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginScreen()), //? SUB ROUTE OF AUTH SCREEN
      ),
      GoRoute(
        name: RouterName.signup,
        path: RouterPath.signup,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignUpScreen()), //? SUB ROUTE OF AUTH SCREEN
      ),
      GoRoute(
        name: RouterName.forget,
        path: RouterPath.forget,
        pageBuilder: (context, state) =>
            const MaterialPage(child: ForgetPasswordScreen()), //? SUB ROUTE OF LOGIN SCREEN
      ),
      GoRoute(
        name: RouterName.checkOTP,
        path: RouterPath.checkOTP,
        pageBuilder: (context, state) =>
            const MaterialPage(child: CheckOTPScreen()), //? SUB ROUTE OF FORGET PASSWORD 
      ),
    ],
  );
}
