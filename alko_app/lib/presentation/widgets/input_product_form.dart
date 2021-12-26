import 'package:alko_app/business_logic/cubit/product/product_cubit.dart';
import 'package:alko_app/constants/assets.dart';
import 'package:alko_app/constants/themes.dart';
import 'package:alko_app/utils/chip_parse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class InputProductForm extends StatelessWidget {
  InputProductForm({Key? key}) : super(key: key);

  double rating = 3.0;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormBuilderTextField(
                  name: "Name",
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: "Enter name",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                const SizedBox(height: 30),
                FormBuilderTextField(
                  name: "AlcoholPercentage",
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Percentage of alcohol",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.match(
                        context, "[0-9][0-9]?[.,]?[0-9]?[0-9]?"),
                    FormBuilderValidators.max(context, 100),
                    FormBuilderValidators.min(context, 0.1),
                  ]),
                ),
                const SizedBox(height: 30),
                FormBuilderTextField(
                  name: "Capacity",
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Capacity (ml)",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.max(context, 5000),
                    FormBuilderValidators.min(context, 0.1),
                  ]),
                ),
                const SizedBox(height: 30),
                FormBuilderDateTimePicker(
                  name: "CreatedAt",
                  alwaysUse24HourFormat: true,
                  currentDate: DateTime.now(),
                  format: DateFormat("yyyy-MM-dd, EEE, hh:mm"),
                  decoration:
                      const InputDecoration(hintText: "when it was drunk?"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                FormBuilderChoiceChip(
                  name: 'Type',
                  decoration: const InputDecoration(
                    labelText: 'Select an option',
                  ),
                  options: getChipOptions(),
                ),
                const SizedBox(height: 30),
                FormBuilderTextField(
                  name: "Price",
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Price",
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.match(
                        context, "[0-9][0-9]?[.,]?[0-9]?[0-9]?",
                        errorText: "Should be like 13 or 13.9"),
                    FormBuilderValidators.max(context, 100000),
                    FormBuilderValidators.min(context, 0.1),
                  ]),
                ),
                const SizedBox(height: 30),
                RatingBar(
                  initialRating: rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: const Image(
                      image: AssetImage(MyAssets.fullHeart),
                      color: MyTheme.fullHeartColor,
                    ),
                    half: const Image(
                      image: AssetImage(MyAssets.halfHeart),
                      color: MyTheme.halfHeartColor,
                    ),
                    empty: const Image(
                      image: AssetImage(MyAssets.emptyHeart),
                      color: MyTheme.emptyHeartColor,
                    ),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    this.rating = rating;
                  },
                ),
                SizedBox(
                  width: 140,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.save();
                        bool validated =
                            _formKey.currentState?.validate() ?? false;

                        FocusScope.of(context).unfocus();

                        if (validated) {
                          BlocProvider.of<ProductCubit>(context).saveProduct(
                              _formKey.currentState!.value, rating);

                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Add",
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
