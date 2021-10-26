import 'package:alko_app/business_logic/cubit/product/product_cubit.dart';
import 'package:alko_app/presentation/widgets/product_item.dart';
import 'package:alko_app/presentation/widgets/product_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final PreferredSizeWidget appBar;

  const MyHomePage({
    Key? key,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double safeAreaHeight =
        height - padding.top - padding.bottom - appBar.preferredSize.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new",
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/add-product');
        },
        child: const Icon(Icons.add),
      ),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ProductSearch(),
            SizedBox(
              height: safeAreaHeight,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded && state.products.isNotEmpty) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          ProductItem(item: state.products[index]),
                    );
                  } else if (state is ProductLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    context.read<ProductCubit>().getAllProducts();
                    return const Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        "Nothing to show... yet :))",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        textScaleFactor: 3,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
