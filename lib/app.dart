import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/custom_theme.dart';
import 'config/themes/cubit/app_theme_cubit.dart';
import 'core/utils/app_strings.dart';
import 'features/myip/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;
import 'features/myip/presentation/cubit/myip_cubit.dart';

class WhatIsMyIPApp extends StatelessWidget {
  const WhatIsMyIPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AppThemeCubit>()..getAppMode()),
        BlocProvider(create: (context) => di.sl<LocaleCubit>()..getSavedLang()),
        BlocProvider(create: (context) => di.sl<MyipCubit>()..getMyip()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, stateTheme) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            buildWhen: (previousState, currentState) {
              return previousState != currentState;
            },
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                themeMode: stateTheme.isDark ? ThemeMode.dark : ThemeMode.light,
                theme: CustomTheme.lightTheme,
                darkTheme: CustomTheme.darkTheme,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                locale: state.locale,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
              );
            },
          );
        },
      ),
    );
  }
}
