import 'package:alko_app/presentation/screens/my_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "Home Page"));
      default:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "Home Page"));
    }
  }

  void dispose() {
    //dispose cubits
  }
}
