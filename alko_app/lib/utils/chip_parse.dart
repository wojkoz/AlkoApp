import 'package:alko_app/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

List<FormBuilderFieldOption<dynamic>> getChipOptions() {
  List<FormBuilderFieldOption<dynamic>> options = [];

  for (var item in alcoholType) {
    options.add(FormBuilderFieldOption(
      value: item,
      child: Text(item),
    ));
  }
  return options;
}
