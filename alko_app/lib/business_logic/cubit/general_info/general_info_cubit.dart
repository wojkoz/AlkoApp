import 'package:alko_app/data/models/most_liked_product.dart';
import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/data/repositories/i_product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_info_state.dart';

class GeneralInfoCubit extends Cubit<GeneralInfoState> {
  final IProductRepository productRepository;

  GeneralInfoCubit({required this.productRepository})
      : super(GeneralInfoInitial());

  void loadGeneralInfo() async {
    emit(GeneralInfoLoading());
    const capacityUnit = "ml";
    const spentsUnit = "zł";
    List<Product> products = await productRepository.getAll();

    var spents = 0.0;
    var capacity = 0.0;

    for (var product in products) {
      capacity += product.bottleCapacity;
      spents += product.price;
    }

    var capacityMonth = 0.0;
    var spentsMonth = 0.0;
    final month = DateTime.now().month;

    List<Product> productsByMonth =
        products.where((product) => product.createdAt.month == month).toList();

    for (var product in productsByMonth) {
      capacityMonth += product.bottleCapacity;
      spentsMonth += product.price;
    }

    emit(
      GeneralInfoLoaded(
          sumCapacity: "$capacity $capacityUnit",
          sumBottles: "${products.length} bottles",
          sumSpents: "$spents $spentsUnit",
          sumCapacityMonth: "$capacityMonth $capacityUnit",
          sumBottlesMonth: "${productsByMonth.length} bottles",
          sumSpentsMonth: "$spentsMonth $spentsUnit"),
    );
  }
}
