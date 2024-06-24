// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EconomyModelAdapter extends TypeAdapter<EconomyModel> {
  @override
  final int typeId = 0;

  @override
  EconomyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EconomyModel(
      id: fields[0] as String,
      title: fields[1] as String,
      count: fields[2] as String,
      income: fields[5] as bool,
      description: fields[3] as String?,
      date: fields[4] as int,
      userId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EconomyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.income)
      ..writeByte(6)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EconomyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
