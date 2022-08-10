import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/hex_color.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      drawerTheme:
          DrawerThemeData(backgroundColor: AppColors.drawerBackgroundLight),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primary),
        trackColor: MaterialStateProperty.all(AppColors.secondary),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      drawerTheme:
          DrawerThemeData(backgroundColor: AppColors.drawerBackgroundDark),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primary),
        trackColor: MaterialStateProperty.all(AppColors.secondary),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 14,
          color: HexColor("#f5fff9"),
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
