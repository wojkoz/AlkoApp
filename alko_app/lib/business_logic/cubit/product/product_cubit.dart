import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final AProductRepository productRepository;

  ProductCubit({required this.productRepository}) : super(ProductInit());

  void getAllProducts() async {
    List<Product> productsList = await productRepository.getAll();

    emit(ProductLoaded(productsList));
  }

  void saveProduct(Product product) async {
    emit(ProductLoading());
    await productRepository.save(product);

    getAllProducts();
  }
}
