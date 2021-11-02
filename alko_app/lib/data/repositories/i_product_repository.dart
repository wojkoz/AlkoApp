import 'package:alko_app/data/models/product.dart';

abstract class IProductRepository {
  Future<void> save(Product product);
  Future<void> saveAll(List<Product> productsList);
  Future<Product> getOne(String id);
  Future<List<Product>> getAll();
}
