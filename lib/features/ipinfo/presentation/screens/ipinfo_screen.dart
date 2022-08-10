import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/ipinfo_cubit.dart';
import '../../../myip/presentation/cubit/myip_cubit.dart';
import '../../../../injection_container.dart' as di;

class IpinfoScreen extends StatefulWidget {
  const IpinfoScreen({Key? key}) : super(key: key);

  @override
  State<IpinfoScreen> createState() => _IpinfoScreenState();
}

class _IpinfoScreenState extends State<IpinfoScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppLocalizations.of(context)!.translate('details')!),
    );

    return BlocProvider(
      create: (context) => di.sl<IpinfoCubit>()
        ..getIpinfo(ip: BlocProvider.of<MyipCubit>(context).myip!.ip),
      child: Scaffold(
        appBar: appBar,
        body: Center(
          child: BlocBuilder<IpinfoCubit, IpinfoState>(
            builder: (context, state) {
              if (state is IpinfoIsLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                );
              } else if (state is IpinfoError) {
                return Text(
                  state.msg,
                );
              } else if (state is IpinfoLoaded) {
                final ipinfo = state.ipinfo;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate('ip_address')!}: ${ipinfo.query}',
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('city')!}: ${ipinfo.city}',
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('country')!}: ${ipinfo.country}',
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('timezone')!}: ${ipinfo.timezone}',
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('org')!}: ${ipinfo.org}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('supplier')!}: ${ipinfo.as}',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.translate('latlang')!}: ${ipinfo.lat}, ${ipinfo.lon}',
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    state.toString(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
