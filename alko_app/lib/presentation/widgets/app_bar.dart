import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PreferredSizeWidget customAppBar(
    {BuildContext? context, required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}
