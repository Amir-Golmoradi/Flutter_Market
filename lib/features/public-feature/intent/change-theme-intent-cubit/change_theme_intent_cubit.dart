import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/shared/shared_pref_helper.dart';
import 'package:flutter_dunimarket/config/styles/theme/theme_config.dart';

part 'change_theme_intent_state.dart';

class ChangeThemeIntentCubit extends Cubit<ChangeThemeIntentState> {
  ChangeThemeIntentCubit() : super(const InitialThemeState(PocketTheme.light));

  final SharedPrefHelper prefHelper = SharedPrefHelper();

  PocketTheme currentTheme = PocketTheme.light;

  void changeTheme() {
    final newTheme = currentTheme == PocketTheme.light
        ? PocketTheme.dark
        : PocketTheme.light;
    emit(ChangedThemeState(newTheme));
    currentTheme = newTheme;
    prefHelper.saveThemeToPrefs(currentTheme);
  }

  ThemeData get currentThemeData => appTheme[currentTheme]!;
}
