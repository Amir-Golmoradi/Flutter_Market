import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dunimarket/config/routing/router_config.dart';
import 'package:flutter_dunimarket/config/styles/theme/theme_config.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_auth_service.dart';
import 'package:flutter_dunimarket/core/database/firebase/firebase_options.dart';
import 'package:flutter_dunimarket/features/auth-feature/intent/bloc/auth_bloc.dart';

import 'package:flutter_dunimarket/features/public-feature/intent/change-theme-intent-cubit/change_theme_intent_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeThemeIntentCubit()),
        BlocProvider(create: (context) => AuthBloc(FirebaseAuthService())),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeIntentCubit, ChangeThemeIntentState>(
      builder: (BuildContext context, ChangeThemeIntentState state) {
        final currentTheme = state.theme;
        final themeData = appTheme[currentTheme];
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: themeData,
        );
      },
    );
  }
}
