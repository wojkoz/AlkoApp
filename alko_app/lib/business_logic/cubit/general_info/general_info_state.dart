part of 'general_info_cubit.dart';

abstract class GeneralInfoState extends Equatable {
  const GeneralInfoState();

  @override
  List<Object> get props => [];
}

class GeneralInfoInitial extends GeneralInfoState {}

class GeneralInfoLoading extends GeneralInfoState {}

class GeneralInfoLoaded extends GeneralInfoState {
  final String sumCapacity;
  final String sumBottles;
  final String sumSpents;
  final MostLikedProduct? mostLikedProduct;
  final String sumCapacityMonth;
  final String sumBottlesMonth;
  final String sumSpentsMonth;

  const GeneralInfoLoaded(
      {required this.sumCapacity,
      required this.sumBottles,
      required this.sumSpents,
      required this.sumCapacityMonth,
      required this.sumBottlesMonth,
      required this.sumSpentsMonth,
      this.mostLikedProduct});

  @override
  List<Object> get props => [
        sumCapacity,
        sumBottles,
        sumSpents,
        sumCapacityMonth,
        sumBottlesMonth,
        sumSpentsMonth
      ];
}
