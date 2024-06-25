/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 19:51:36
 * @LastEditTime: 2024-06-25 21:31:09
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:journal/page/detail.dart';
import 'package:journal/page/home.dart';

class RouteManager {
  static const String home = '/';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return buildPage(
          const HomePage(),
          settings: settings,
        );
      case detail:
        return buildPage(
          DetailPage(),
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
