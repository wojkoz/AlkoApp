import 'package:alko_app/constants/assets.dart';
import 'package:alko_app/constants/themes.dart';
import 'package:flutter/material.dart';

class RatingIcons {
  static const fullHeart = Image(
    image: AssetImage(MyAssets.fullHeart),
    color: MyTheme.fullHeartColor,
  );
  static const halfHeart = Image(
      image: AssetImage(MyAssets.halfHeart), color: MyTheme.halfHeartColor);

  static List<Widget> createListOfHearts(double rating) {
    int integerValue = rating.floor();

    List<Widget> hearts = [];

    for (int i = 0; i < integerValue; i++) {
      hearts.add(fullHeart);
    }

    if (rating > integerValue) {
      hearts.add(halfHeart);
    }
    return hearts;
  }
}
