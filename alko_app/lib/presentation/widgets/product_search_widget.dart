import 'package:alko_app/business_logic/cubit/filter/product_filter_cubit.dart';
import 'package:alko_app/utils/chip_parse.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  bool visibleSearch = false;
  final _formKey = GlobalKey<FormBuilderState>();

  void toggleVisibility() {
    setState(() {
      visibleSearch = !visibleSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Visibility(
              visible: visibleSearch,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: FormBuilder(
                      key: _formKey,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 300,
                            child: FormBuilderTextField(
                              name: "FilterName",
                              decoration: const InputDecoration(
                                labelText: "Type product name...",
                              ),
                              maxLength: 20,
                              onChanged: (value) {
                                if (value != null && value.isNotEmpty) {
                                  EasyDebounce.debounce("filter-name",
                                      const Duration(milliseconds: 500), () {
                                    BlocProvider.of<ProductFilterCubit>(context)
                                        .filterByName(value);
                                  });
                                } else {
                                  EasyDebounce.debounce("filter-name",
                                      const Duration(milliseconds: 500), () {
                                    BlocProvider.of<ProductFilterCubit>(context)
                                        .resetFilter();
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          SizedBox(
                            width: 300,
                            child: FormBuilderDateRangePicker(
                              name: "FilterDateTimeRange",
                              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                              lastDate: DateTime.now(),
                              currentDate: DateTime.now(),
                              format: DateFormat("yyyy-MM-dd, EEE"),
                              decoration: const InputDecoration(
                                  hintText: "Select range to filter..."),
                              onChanged: (dateRange) {
                                if (dateRange != null) {
                                  BlocProvider.of<ProductFilterCubit>(context)
                                      .filterByDate(
                                          dateRange.start, dateRange.end);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          SizedBox(
                            width: 300,
                            child: FormBuilderChoiceChip(
                              name: "FilterChipType",
                              options: getChipOptions(),
                              onChanged: (dynamic chip) {
                                if (chip != null) {
                                  BlocProvider.of<ProductFilterCubit>(context)
                                      .filterByType(chip as String);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !visibleSearch
                    ? Visibility(
                        visible: !visibleSearch,
                        child: ElevatedButton(
                          onPressed: toggleVisibility,
                          child: const Text("Show Filter"),
                        ),
                      )
                    : Visibility(
                        visible: visibleSearch,
                        child: ElevatedButton(
                          onPressed: toggleVisibility,
                          child: const Text("Hide Filter"),
                        ),
                      ),
                Visibility(
                  visible: visibleSearch,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      BlocProvider.of<ProductFilterCubit>(context)
                          .resetFilter();
                    },
                    child: const Text("Reset Filter"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
