import 'package:alko_app/business_logic/cubit/product_cubit.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';
import 'package:alko_app/data/repositories/implementation/product_repository.dart';
import 'package:alko_app/presentation/screens/my_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final AProductRepository _productRepository = ProductRepository();

  AppRouter();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      ProductCubit(productRepository: _productRepository),
                  child: const MyHomePage(title: "Home Page"),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "Home Page"));
    }
  }

  void dispose() {
    //dispose cubits
  }
}
