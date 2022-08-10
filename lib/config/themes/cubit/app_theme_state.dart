part of 'app_theme_cubit.dart';

abstract class AppThemeState extends Equatable {
  final bool isDark;
  const AppThemeState(this.isDark);

  @override
  List<Object> get props => [isDark];
}

class AppThemeChangeModeState extends AppThemeState {
  const AppThemeChangeModeState(bool isDark) : super(isDark);
}
