import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatismyip/core/utils/app_strings.dart';
part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final SharedPreferences sharedPreferences;

  AppThemeCubit({required this.sharedPreferences})
      : super(const AppThemeChangeModeState(false));

  Future<void> getAppMode() async {
    bool isDark = false;

    if (sharedPreferences.getBool(AppStrings.isDarkMode) == null) {
      // Get the default theme mode
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      isDark = brightness == Brightness.dark;
      emit(AppThemeChangeModeState(isDark));
    } else {
      isDark = sharedPreferences.getBool(AppStrings.isDarkMode)!;
      emit(AppThemeChangeModeState(isDark));
    }
  }

  Future<void> changeAppMode() async {
    bool isDark = sharedPreferences.getBool(AppStrings.isDarkMode) ?? false;
    if (isDark == true) {
      isDark = false;
    } else {
      isDark = true;
    }
    sharedPreferences.setBool(AppStrings.isDarkMode, isDark);
    emit(AppThemeChangeModeState(isDark));
  }
}
