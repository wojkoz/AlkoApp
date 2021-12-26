import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    {BuildContext? context, required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}
