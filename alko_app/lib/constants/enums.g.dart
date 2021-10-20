// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlcoholTypeAdapter extends TypeAdapter<AlcoholType> {
  @override
  final int typeId = 100;

  @override
  AlcoholType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AlcoholType.cider;
      case 1:
        return AlcoholType.beer;
      case 2:
        return AlcoholType.vodka;
      case 3:
        return AlcoholType.whiskey;
      case 4:
        return AlcoholType.gin;
      case 5:
        return AlcoholType.rum;
      case 6:
        return AlcoholType.tequila;
      case 7:
        return AlcoholType.brandy;
      case 8:
        return AlcoholType.liqueur;
      case 9:
        return AlcoholType.mead;
      case 10:
        return AlcoholType.absinthe;
      default:
        return AlcoholType.cider;
    }
  }

  @override
  void write(BinaryWriter writer, AlcoholType obj) {
    switch (obj) {
      case AlcoholType.cider:
        writer.writeByte(0);
        break;
      case AlcoholType.beer:
        writer.writeByte(1);
        break;
      case AlcoholType.vodka:
        writer.writeByte(2);
        break;
      case AlcoholType.whiskey:
        writer.writeByte(3);
        break;
      case AlcoholType.gin:
        writer.writeByte(4);
        break;
      case AlcoholType.rum:
        writer.writeByte(5);
        break;
      case AlcoholType.tequila:
        writer.writeByte(6);
        break;
      case AlcoholType.brandy:
        writer.writeByte(7);
        break;
      case AlcoholType.liqueur:
        writer.writeByte(8);
        break;
      case AlcoholType.mead:
        writer.writeByte(9);
        break;
      case AlcoholType.absinthe:
        writer.writeByte(10);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlcoholTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
