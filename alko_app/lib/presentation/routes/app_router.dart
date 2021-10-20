import 'package:alko_app/presentation/screens/my_home_screen.dart';
import 'package:alko_app/presentation/screens/product_input_screen.dart';
import 'package:alko_app/presentation/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(
            appBar: customAppBar(title: "Home Page"),
          ),
        );
      case '/add-product':
        return MaterialPageRoute(
          builder: (_) => ProductInputScreen(
            appBar: customAppBar(title: "Add new product"),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) =>
                MyHomePage(appBar: customAppBar(title: "Home Page")));
    }
  }

  void dispose() {
    //dispose cubits
  }
}
