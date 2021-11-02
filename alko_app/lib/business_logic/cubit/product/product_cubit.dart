import 'dart:async';

import 'package:alko_app/business_logic/cubit/filter/product_filter_cubit.dart';
import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/i_product_repository.dart';
import 'package:alko_app/data/services/i_product_filter_service.dart';
import 'package:alko_app/data/services/implementation/product_filter_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nanoid/async.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final IProductRepository productRepository;
  final IProductFilterService _filterService = ProductFilterService();
  final ProductFilterCubit filterCubit;
  late StreamSubscription filterStreamSubscription;

  ProductCubit({required this.productRepository, required this.filterCubit})
      : super(ProductInit()) {
    filterStreamSubscription = createFilterSubscription();
  }

  StreamSubscription createFilterSubscription() {
    //(state as ProductLoaded).products.where((element) => false)
    return filterCubit.stream.listen((filterState) {
      var productsTofilter = (state as ProductLoaded).products;

      if (filterState is ProductFilterReset) {
        getAllProducts();
      } else if (filterState is ProductFilterByType) {
        emitProducts(() =>
            _filterService.filterByType(productsTofilter, filterState.type));
      } else if (filterState is ProductFilterByName) {
        filterState.name.isEmpty
            ? getAllProducts()
            : emitProducts(() => _filterService.filterByName(
                productsTofilter, filterState.name));
      } else if (filterState is ProductFilterByDate) {
        emitProducts(() => _filterService.filterByDate(
            productsTofilter, filterState.start, filterState.end));
      }
    });
  }

  void emitProducts(List<Product> Function() getProducts) {
    emit(ProductLoading());
    List<Product> productsList = getProducts();

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
