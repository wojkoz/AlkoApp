import 'package:flutter/material.dart';

class ProductGeneralInfo extends StatelessWidget {
  const ProductGeneralInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blueAccent,
      child: Column(
        children: const [
          Text("Text1"),
          Text("data"),
        ],
      ),
    );
  }
}
