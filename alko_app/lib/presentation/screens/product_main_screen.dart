import 'package:alko_app/business_logic/cubit/product/product_cubit.dart';
import 'package:alko_app/presentation/widgets/product_item.dart';
import 'package:alko_app/presentation/widgets/product_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMainScreen extends StatelessWidget {
  const ProductMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            child: ProductSearch(),
          ),
          SizedBox(
            height: height * 0.75,
            width: width,
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) =>
                          ProductItem(item: state.products[index]),
                    ),
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
    );
  }
}
