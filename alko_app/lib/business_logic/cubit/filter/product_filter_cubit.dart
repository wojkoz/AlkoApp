import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_filter_state.dart';

class ProductFilterCubit extends Cubit<ProductFilterState> {
  ProductFilterCubit() : super(ProductFilterInitial());

  void filterByType(String type) {
    emit(ProductFilterByType(type));
  }

  void filterByName(String name) {
    emit(ProductFilterByName(name));
  }

  void filterByDate(DateTime start, DateTime end) {
    emit(ProductFilterByDate(start, end));
  }

  void filterByAlcoholPercentage(double start, {double? end}) {
    emit(ProductFilterByAlcoholPercentage(start, end));
  }

  void filterByRate(double start, {double end = 5}) {
    emit(ProductFilterByRate(start, end));
  }

  void filterByPrice(double start, {double? end}) {
    emit(ProductFilterByPrice(start, end));
  }

  void resetFilter() {
    emit(ProductFilterReset());
  }
}
