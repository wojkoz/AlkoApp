import 'package:alko_app/data/models/product.dart';
import 'package:flutter/material.dart';

abstract class AProductRepository {
  final productBoxPath = "products_box";
  Future<void> save(Product product);
  Future<void> saveAll(List<Product> productsList);
  Future<Product> getOne(String id);
  Future<List<Product>> getAll();
  Future<List<Product>> getFilteredByType(String filterByType);
  Future<List<Product>> getFilteredByName(String filterByName);
  Future<List<Product>> getFilteredByDate(DateTimeRange filterByDate);
  Future<List<Product>> getFilteredByAlcoholPercentage(
      double start, double? end);
  Future<List<Product>> getFilteredByRate(double start, double? end);
  Future<List<Product>> getFilteredByPrice(double start, double? end);
}
