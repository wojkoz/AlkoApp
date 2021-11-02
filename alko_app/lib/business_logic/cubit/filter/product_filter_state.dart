part of 'product_filter_cubit.dart';

abstract class ProductFilterState extends Equatable {
  const ProductFilterState();

  @override
  List<Object> get props => [];
}

class ProductFilterInitial extends ProductFilterState {}

class ProductFilterReset extends ProductFilterState {}

class ProductFilterByType extends ProductFilterState {
  final String type;

  const ProductFilterByType(this.type);

  @override
  List<Object> get props => [type];
}

class ProductFilterByName extends ProductFilterState {
  final String name;

  const ProductFilterByName(this.name);

  @override
  List<Object> get props => [name];
}

class ProductFilterByDate extends ProductFilterState {
  final DateTime start;
  final DateTime end;

  const ProductFilterByDate(this.start, this.end);

  @override
  List<Object> get props => [start, end];
}

class ProductFilterByAlcoholPercentage extends ProductFilterState {
  final double start;
  final double? end;

  const ProductFilterByAlcoholPercentage(this.start, this.end);

  @override
  List<Object> get props => [start];
}

class ProductFilterByRate extends ProductFilterState {
  final double startRange;
  final double? endRange;

  const ProductFilterByRate(this.startRange, this.endRange);

  @override
  List<Object> get props => [startRange];
}

class ProductFilterByPrice extends ProductFilterState {
  final double startRange;
  final double? endRange;

  const ProductFilterByPrice(this.startRange, this.endRange);

  @override
  List<Object> get props => [startRange];
}
