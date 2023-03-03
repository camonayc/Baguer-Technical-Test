import 'package:flutter/material.dart';
import 'package:technical_test_baguer/screens/screens.dart';

abstract class AppRoutes {
  static const login = '/loginScreen';
  static const home = '/homeScreen';
  static const details = '/detailsScreen';
}

class AppRouting {
  static PageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/loginScreen':
        return _fadeRoute(LoginScreen(), settings);
      case '/homeScreen':
        return _fadeRoute(HomeScreen(), settings);
      case '/detailsScreen':
        return _fadeRoute(DetailsScreen(), settings);
      default:
        return _fadeRoute(LoginScreen(), settings);
    }
  }

  static PageRoute _fadeRoute(Widget view, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (_, animation1, animation2) => view,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 10),
        transitionsBuilder: (_, animation1, animation2, _____) =>
            FadeTransition(
              opacity: animation1,
              child: view,
            ));
  }
}