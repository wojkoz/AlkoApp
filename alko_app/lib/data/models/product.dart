import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double? price;
  final double alcoholPercentage;

  const Product({
    required this.id,
    required this.name,
    this.price,
    required this.alcoholPercentage,
  });

  @override
  List<Object?> get props => [id, name, alcoholPercentage, price];

  Product copyWith({
    int? id,
    String? name,
    double? price,
    double? alcoholPercentage,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      alcoholPercentage: alcoholPercentage ?? this.alcoholPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'alcoholPercentage': alcoholPercentage,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      alcoholPercentage: map['alcoholPercentage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
