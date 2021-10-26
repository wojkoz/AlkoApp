import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';

class ProductRepository extends AProductRepository {
  @override
  Future<List<Product>> getAll() async {
    var box = await Hive.openBox<Product>(productBoxPath);
    return box.values.toList();
  }

  @override
  Future<Product> getOne(String id) async {
    var box = await Hive.openBox<Product>(productBoxPath);
    if (box.containsKey(id)) {
      Product? product = box.get(id);
      if (product != null) {
        return product;
      }
    }

    throw Exception("Id: $id doesn't exists!");
  }

  @override
  Future<void> save(Product product) async {
    var box = await Hive.openBox<Product>(productBoxPath);
    box.put(product.id, product);
  }

  @override
  Future<void> saveAll(List<Product> productsList) async {
    for (var element in productsList) {
      await save(element);
    }
  }

  @override
  Future<List<Product>> getFilteredByAlcoholPercentage(
      double start, double? end) async {
    List<Product> products = await getAll();

    if (end != null) {
      return products
          .where((element) =>
              element.alcoholPercentage >= start &&
              element.alcoholPercentage <= end)
          .toList();
    }

    return products
        .where((element) => element.alcoholPercentage >= start)
        .toList();
  }

  @override
  Future<List<Product>> getFilteredByDate(DateTimeRange filterByDate) async {
    List<Product> products = await getAll();

    if (filterByDate.start.difference(filterByDate.end).inSeconds == 0) {
      return products
          .where(
              (element) => element.createdAt.compareTo(filterByDate.start) == 0)
          .toList();
    }

    var filtered = products
        .where(
            (element) => element.createdAt.compareTo(filterByDate.start) <= 0)
        .toList();

    return filtered
        .where((element) => element.createdAt.compareTo(filterByDate.end) >= 0)
        .toList();
  }

  @override
  Future<List<Product>> getFilteredByName(String filterByName) async {
    List<Product> products = await getAll();
    return products
        .where((element) =>
            element.name.toLowerCase().contains(filterByName.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Product>> getFilteredByPrice(double start, double? end) async {
    List<Product> products = await getAll();

    if (end != null) {
      return products
          .where((element) => element.price >= start && element.price <= end)
          .toList();
    }

    return products.where((element) => element.price >= start).toList();
  }

  @override
  Future<List<Product>> getFilteredByRate(double start, double? end) async {
    List<Product> products = await getAll();

    if (end != null) {
      return products
          .where((element) => element.rate >= start && element.rate <= end)
          .toList();
    }

    return products.where((element) => element.rate >= start).toList();
  }

  @override
  Future<List<Product>> getFilteredByType(String filterByType) async {
    List<Product> products = await getAll();
    return products
        .where((element) =>
            element.type.toLowerCase() == filterByType.toLowerCase())
        .toList();
  }
}
