part of 'change_theme_intent_cubit.dart';

@immutable
abstract class ChangeThemeIntentState extends Equatable {
  const ChangeThemeIntentState();

  PocketTheme get theme;

  @override
  List<Object?> get props => [theme];
}

class InitialThemeState extends ChangeThemeIntentState {
  const InitialThemeState(this.appTheme);

  final PocketTheme appTheme;

  @override
  PocketTheme get theme => appTheme;

  @override
  List<Object?> get props => [theme];
}

class ChangedThemeState extends ChangeThemeIntentState {
  const ChangedThemeState(this.newTheme);

  final PocketTheme newTheme;

  @override
  PocketTheme get theme => newTheme;

  @override
  List<Object?> get props => [theme];
}
