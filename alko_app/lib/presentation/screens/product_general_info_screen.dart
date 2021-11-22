import 'package:alko_app/business_logic/cubit/general_info/general_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGeneralInfo extends StatelessWidget {
  const ProductGeneralInfo({Key? key}) : super(key: key);

  final headerTextStyle =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  final ordinaryTextStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blueAccent,
      child: BlocBuilder<GeneralInfoCubit, GeneralInfoState>(
        builder: (context, state) {
          if (state is GeneralInfoInitial) {
            context.read<GeneralInfoCubit>().loadGeneralInfo();
            return const SizedBox();
          } else if (state is GeneralInfoLoading) {
            return const CircularProgressIndicator();
          } else if (state is GeneralInfoLoaded) {
            return _buildInfoColumn(state);
          } else {
            return const Text("Something went wrong with cubit");
          }
        },
      ),
    );
  }

  Widget _buildInfoColumn(GeneralInfoLoaded state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "You have drunk:",
            style: headerTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              state.sumCapacity,
              style: ordinaryTextStyle,
            ),
            Text(
              state.sumBottles,
              style: ordinaryTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "You have spent:",
            style: headerTextStyle,
          ),
        ),
        Text(
          state.sumSpents,
          style: ordinaryTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            "This month:",
            style: headerTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              state.sumCapacityMonth,
              style: ordinaryTextStyle,
            ),
            Text(
              state.sumBottlesMonth,
              style: ordinaryTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.sumSpentsMonth,
                style: ordinaryTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
