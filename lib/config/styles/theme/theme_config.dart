import 'package:flutter/material.dart';
import 'package:flutter_dunimarket/config/styles/theme/colors_config.dart';

enum PocketTheme { light, dark }

final Map<PocketTheme, ThemeData> appTheme = {
  PocketTheme.light: AppTheme.lightTheme,
  PocketTheme.dark: AppTheme.darkTheme,
};

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // ========================================================

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.lightBackGround,
    ),

    // ========================================================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.lightButtonBG,
        foregroundColor: AppColor.lightButtonFG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),

    // ========================================================

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.lightButtonBG,
        foregroundColor: AppColor.lightButtonFG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: AppColor.lightBackGround, //? Application Background Color
      primary: AppColor.lightTexture, //? Application Important Texts and Icons
      secondary: AppColor.lightSecondary, //? Application Less Important Texts
      tertiary: AppColor.lightTertiary, //? All Other custom objects.
      inversePrimary:
          AppColor.lightFields, //? Only For FIELDS -> TextFields, FormFields
    ),
  );

  // ========================================================

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkBackGround,
    ),

    // ========================================================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.darkButtonBG,
        foregroundColor: AppColor.darkButtonFG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),

    // ========================================================

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.darkButtonBG,
        foregroundColor: AppColor.darkButtonFG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),

    // ========================================================

    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: AppColor.darkBackGround, //? Application Background Color
      primary: AppColor.darkTexture, //? Application Important Texts and Icons
      secondary: AppColor.darkSecondary, //? Application Less Important Texts
      tertiary: AppColor.darkTertiary, //? All Other custom objects.
      inversePrimary:
          AppColor.darkFields, //? Only For FIELDS -> TextFields, FormFields
    ),
  );
}
