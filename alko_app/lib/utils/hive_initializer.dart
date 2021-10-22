import 'package:alko_app/data/models/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
}
