import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double? price;

  @HiveField(3)
  final double alcoholPercentage;

  @HiveField(4)
  final double bottleCapacity;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final double? rate;

  const Product({
    required this.bottleCapacity,
    required this.createdAt,
    this.rate,
    required this.id,
    required this.name,
    this.price,
    required this.alcoholPercentage,
  });

  @override
  List<Object?> get props =>
      [id, name, alcoholPercentage, price, rate, bottleCapacity, createdAt];

  Product copyWith({
    String? id,
    String? name,
    double? price,
    double? alcoholPercentage,
    double? bottleCapacity,
    DateTime? createdAt,
    double? rate,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      alcoholPercentage: alcoholPercentage ?? this.alcoholPercentage,
      bottleCapacity: bottleCapacity ?? this.bottleCapacity,
      createdAt: createdAt ?? this.createdAt,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'alcoholPercentage': alcoholPercentage,
      'bottleCapacity': bottleCapacity,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      alcoholPercentage: map['alcoholPercentage'],
      bottleCapacity: map['bottleCapacity'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      rate: map['rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
