import 'package:alko_app/data/models/product.dart';
import 'package:alko_app/presentation/widgets/generate_rating_icons.dart';
import 'package:alko_app/utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  const ProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Chip(
                      label: Text(item.type),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Alcohol: ${item.alcoholPercentage.toStringAsFixed(2)}%"),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Text("${item.bottleCapacity}ml"),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.beer,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...RatingIcons.createListOfHearts(item.rate),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(getFormattedDateForItem(item.createdAt)),
                    Text("Cost: ${item.price?.toStringAsFixed(2)}"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
