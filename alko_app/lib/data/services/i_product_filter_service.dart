import 'package:alko_app/data/models/product.dart';

abstract class IProductFilterService {
  List<Product> filterByType(
      List<Product> productsToFilter, String filterByType);

  List<Product> filterByName(
      List<Product> productsToFilter, String filterByName);

  List<Product> filterByDate(
      List<Product> productsToFilter, DateTime start, DateTime end);

  List<Product> filterByAlcoholPercentage(
      List<Product> productsToFilter, double start, double? end);

  List<Product> filterByRate(
      List<Product> productsToFilter, double start, double? end);

  List<Product> filterByPrice(
      List<Product> productsToFilter, double start, double? end);
}
