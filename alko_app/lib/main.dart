import 'package:alko_app/business_logic/cubit/filter/product_filter_cubit.dart';
import 'package:alko_app/business_logic/cubit/general_info/general_info_cubit.dart';
import 'package:alko_app/data/repositories/i_product_repository.dart';
import 'package:alko_app/data/repositories/implementation/product_repository.dart';
import 'package:flutter/material.dart';

import 'package:alko_app/presentation/routes/app_router.dart';
import 'package:alko_app/utils/hive_initializer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/product/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  runApp(MyApp(
    productRepository: ProductRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final IProductRepository productRepository;

  MyApp({Key? key, required this.productRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductFilterCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            productRepository: productRepository,
            filterCubit: context.read<ProductFilterCubit>(),
          ),
        ),
        BlocProvider(
          create: (context) => GeneralInfoCubit(
            productRepository: productRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Alko check',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
