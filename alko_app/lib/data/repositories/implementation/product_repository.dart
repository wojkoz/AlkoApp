import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';
import 'package:hive/hive.dart';

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
}
