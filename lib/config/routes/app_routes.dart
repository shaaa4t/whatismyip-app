import 'package:flutter/material.dart';
import '../../features/ipinfo/presentation/screens/ipinfo_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../features/myip/presentation/screens/myip_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String ipInfoRoute = '/ipInfoRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: ((context) {
            return const MyipScreen();
          }),
        );
      case Routes.ipInfoRoute:
        return MaterialPageRoute(
          builder: ((context) {
            return const IpinfoScreen();
          }),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
