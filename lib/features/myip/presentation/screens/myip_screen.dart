import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/media_query_values.dart';
import '../cubit/myip_cubit.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;
import '../widgets/my_drawer.dart';

class MyipScreen extends StatefulWidget {
  const MyipScreen({Key? key}) : super(key: key);

  @override
  State<MyipScreen> createState() => _MyipScreenState();
}

class _MyipScreenState extends State<MyipScreen> {
  _getMyip() => BlocProvider.of<MyipCubit>(context).getMyip();

  @override
  void initState() {
    super.initState();
    _getMyip();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );

    return Scaffold(
      appBar: appBar,
      drawer: const MyDrawer(),
      body: Center(
        child: BlocBuilder<MyipCubit, MyipState>(
          builder: (context, state) {
            if (state is MyipIsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondary,
                ),
              );
            } else if (state is MyipError) {
              return error_widget.ErrorWidget(
                onPress: () => _getMyip(),
              );
            } else if (state is MyipLoaded) {
              final myip = state.myip;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myip.ip,
                  ),
                  Text(
                    myip.country,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.ipInfoRoute);
                    },
                    child: Container(
                      height: 35,
                      width: context.width * .3,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondary,
                            AppColors.primary,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.translate('details')!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
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
    );
  }
}
