import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/themes/cubit/app_theme_cubit.dart';
import 'package:whatismyip/features/myip/presentation/cubit/locale_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  value: state.isDark,
                  inactiveTrackColor: Colors.grey,
                  title: Text(
                    AppLocalizations.of(context)!.translate('dark_mode')!,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    BlocProvider.of<AppThemeCubit>(context).changeAppMode();
                  },
                );
              },
            ),
            BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                return SwitchListTile(
                  value: state.locale.languageCode == 'ar',
                  inactiveTrackColor: Colors.grey,
                  title: Text(
                    AppLocalizations.of(context)!.translate('arabic')!,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toArabic();
                    } else {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
