import 'dart:async';

import 'package:alko_app/business_logic/cubit/filter/product_filter_cubit.dart';
import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/a_product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nanoid/async.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final AProductRepository productRepository;
  final ProductFilterCubit filterCubit;
  late StreamSubscription filterStreamSubscription;

  ProductCubit({required this.productRepository, required this.filterCubit})
      : super(ProductInit()) {
    filterStreamSubscription = createFilterSubscription();
  }

  StreamSubscription createFilterSubscription() {
    //(state as ProductLoaded).products.where((element) => false)
    return filterCubit.stream.listen((filterState) {
      if (filterState is ProductFilterReset) {
        getAllProducts();
      } else if (filterState is ProductFilterByType) {
        emitProducts(
            () => productRepository.getFilteredByType(filterState.type));
      } else if (filterState is ProductFilterByName) {
        emitProducts(
            () => productRepository.getFilteredByName(filterState.name));
      } else if (filterState is ProductFilterByDate) {
        emitProducts(
            () => productRepository.getFilteredByDate(filterState.dateRange));
      }
    });
  }

  void emitProducts(Future<List<Product>> Function() getProducts) async {
    emit(ProductLoading());
    List<Product> productsList = await getProducts();

    emit(ProductLoaded(productsList));
  }

  void getAllProducts() async {
    emit(ProductLoading());
    List<Product> productsList = await productRepository.getAll();

    emit(ProductLoaded(productsList));
  }

  void saveProduct(Map<String, dynamic> productMap, double rating) async {
    emit(ProductLoading());

    try {
      Product product = Product(
        bottleCapacity: double.parse(productMap["Capacity"]),
        createdAt: productMap["CreatedAt"],
        id: await nanoid(10),
        name: productMap["Name"],
        alcoholPercentage: double.parse(productMap["AlcoholPercentage"]),
        price: double.parse(productMap["Price"]),
        rate: rating,
        type: productMap["Type"],
      );

      await productRepository.save(product);
      getAllProducts();
    } catch (e) {
      //TODO!: on error occured should emit ProductAddError state
      emit(ProductInit());
    }
  }

  @override
  Future<void> close() {
    filterStreamSubscription.cancel();
    return super.close();
  }
}
