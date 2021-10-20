import 'package:alko_app/presentation/widgets/input_product_form.dart';
import 'package:flutter/material.dart';

class ProductInputScreen extends StatelessWidget {
  final PreferredSizeWidget appBar;
  const ProductInputScreen({Key? key, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Center(
          child: InputProductForm(),
        ),
      ),
    );
  }
}
