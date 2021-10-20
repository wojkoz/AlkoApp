import 'package:hive/hive.dart';

part 'enums.g.dart';

enum ConnectionType { wifi, mobile }

@HiveType(typeId: 100)
enum AlcoholType {
  @HiveField(0)
  cider,
  @HiveField(1)
  beer,
  @HiveField(2)
  vodka,
  @HiveField(3)
  whiskey,
  @HiveField(4)
  gin,
  @HiveField(5)
  rum,
  @HiveField(6)
  tequila,
  @HiveField(7)
  brandy,
  @HiveField(8)
  liqueur,
  @HiveField(9)
  mead,
  @HiveField(10)
  absinthe
}
