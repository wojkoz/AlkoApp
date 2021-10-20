import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nanoid/async.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final AProductRepository productRepository;

  ProductCubit({required this.productRepository}) : super(ProductInit());

  void getAllProducts() async {
    List<Product> productsList = await productRepository.getAll();

    emit(ProductLoaded(productsList));
  }

  void saveProduct(Map<String, dynamic> productMap, double? rating) async {
    emit(ProductLoading());

    try {
      Product product = Product(
          bottleCapacity: double.parse(productMap["Capacity"]),
          createdAt: productMap["CreatedAt"],
          id: await nanoid(10),
          name: productMap["Name"],
          alcoholPercentage: double.parse(productMap["AlcoholPercentage"]),
          price: productMap["Price"] != null
              ? double.parse(productMap["Price"])
              : null,
          rate: rating);

      await productRepository.save(product);
      getAllProducts();
    } catch (e) {
      print("$e : $productMap}");
      //TODO!: on error occured should emit ProductAddError state
      emit(ProductInit());
    }
  }
}
