import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dunimarket/config/styles/theme/theme_config.dart';
import 'package:flutter_dunimarket/features/public-feature/intent/change-theme-intent-cubit/change_theme_intent_cubit.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    required this.onChanged,
    super.key,
  });
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ChangeThemeIntentCubit>();
    final isDarkTheme = themeCubit.state.theme == PocketTheme.dark;
    return Switch(
      value: isDarkTheme,
      activeColor: Colors.white,
      activeTrackColor: Colors.green[400],
      inactiveTrackColor: Colors.grey[300],
      onChanged: onChanged,
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      thumbColor: const WidgetStatePropertyAll(Colors.white),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
    );
  }
}
