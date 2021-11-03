import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/services/i_product_filter_service.dart';

class ProductFilterService implements IProductFilterService {
  @override
  List<Product> filterByAlcoholPercentage(
      List<Product> productsToFilter, double start, double? end) {
    if (end != null) {
      return productsToFilter
          .where((element) =>
              element.alcoholPercentage >= start &&
              element.alcoholPercentage <= end)
          .toList();
    }

    return productsToFilter
        .where((element) => element.alcoholPercentage >= start)
        .toList();
  }

  @override
  List<Product> filterByDate(
      List<Product> productsToFilter, DateTime start, DateTime end) {
    if (start.difference(end).inSeconds == 0) {
      return productsToFilter
          .where((element) => element.createdAt.day == start.day)
          .toList();
    }

    var filtered = productsToFilter
        .where((element) => element.createdAt.compareTo(start) >= 0)
        .toList();

    return filtered
        .where((element) => element.createdAt.compareTo(end) <= 0)
        .toList();
  }

  @override
  List<Product> filterByName(
      List<Product> productsToFilter, String filterByName) {
    return productsToFilter
        .where((element) =>
            element.name.toLowerCase().contains(filterByName.toLowerCase()))
        .toList();
  }

  @override
  List<Product> filterByPrice(
      List<Product> productsToFilter, double start, double? end) {
    if (end != null) {
      return productsToFilter
          .where((element) => element.price >= start && element.price <= end)
          .toList();
    }

    return productsToFilter.where((element) => element.price >= start).toList();
  }

  @override
  List<Product> filterByRate(
      List<Product> productsToFilter, double start, double? end) {
    if (end != null) {
      return productsToFilter
          .where((element) => element.rate >= start && element.rate <= end)
          .toList();
    }

    return productsToFilter.where((element) => element.rate >= start).toList();
  }

  @override
  List<Product> filterByType(
      List<Product> productsToFilter, String filterByType) {
    return productsToFilter
        .where((element) =>
            element.type.toLowerCase() == filterByType.toLowerCase())
        .toList();
  }
}
