import 'package:equatable/equatable.dart';

import 'product.dart';

class MostLikedProduct extends Equatable {
  final Product product;
  final int quantity;
  final double avgRating;

  const MostLikedProduct(
      {required this.product, required this.quantity, required this.avgRating});

  @override
  List<Object> get props => [product, quantity, avgRating];
}
