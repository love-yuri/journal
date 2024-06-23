import 'package:flutter/material.dart';
import 'package:journal/page/home.dart';

class RouteManager {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return buildPage(
          const HomePage(),
          settings: settings,
        );
      default:
        return buildPage(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }

  static MaterialPageRoute buildPage(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
