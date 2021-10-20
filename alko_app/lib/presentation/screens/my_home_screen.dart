import 'package:alko_app/business_logic/cubit/product/product_cubit.dart';
import 'package:alko_app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid/async.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 200,
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded && state.products.isNotEmpty) {
                    return ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) =>
                            Text(state.products[index].name));
                  } else if (state is ProductLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    context.read<ProductCubit>().getAllProducts();
                    return const Text("init");
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  //! temporary solution. just for testing purpouse
                  Product p = Product(
                      bottleCapacity: 2.0,
                      createdAt: DateTime.now(),
                      id: await nanoid(10),
                      name: "Test Beer",
                      alcoholPercentage: 5.7);

                  BlocProvider.of<ProductCubit>(context).saveProduct(p);
                },
                child: const Text("Add product")),
          ],
        ),
      ),
    );
  }
}
