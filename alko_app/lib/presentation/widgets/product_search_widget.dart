import 'package:alko_app/business_logic/cubit/filter/product_filter_cubit.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  bool visibleSearch = false;

  void toggleVisibility() {
    setState(() {
      visibleSearch = !visibleSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Visibility(
            visible: visibleSearch,
            child: Column(
              children: [
                FormBuilder(
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "FilterName",
                        decoration: const InputDecoration(
                          labelText: "Type product name...",
                        ),
                        maxLength: 20,
                        onChanged: (value) {
                          if (value != null) {
                            EasyDebounce.debounce("filter-name",
                                const Duration(milliseconds: 500), () {
                              BlocProvider.of<ProductFilterCubit>(context)
                                  .filterByName(value);
                            });
                          }
                        },
                      ),
                    ],
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
                    BlocProvider.of<ProductFilterCubit>(context).resetFilter();
                  },
                  child: const Text("Reset Filter"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
