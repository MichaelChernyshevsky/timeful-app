// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economy_stat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EconomyStatAdapter extends TypeAdapter<EconomyStat> {
  @override
  final int typeId = 1;

  @override
  EconomyStat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EconomyStat(
      income: fields[0] as int,
      moneyAll: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EconomyStat obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.income)
      ..writeByte(1)
      ..write(obj.moneyAll);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EconomyStatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
