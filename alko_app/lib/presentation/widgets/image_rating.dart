import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageRating extends StatelessWidget {
  final String imageName;
  final Color? color;

  const ImageRating({Key? key, required this.imageName, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return Image(image: AssetImage('assets/images/$imageName'));
    }
    return Image(
      image: AssetImage('assets/images/$imageName'),
      color: color,
    );
  }
}
