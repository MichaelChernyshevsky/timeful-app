// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_time__class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartTimeAdapter extends TypeAdapter<PartTime> {
  @override
  final int typeId = 2;

  @override
  PartTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartTime(
      index: fields[0] as int,
      partTime: fields[1] as PartTimeEnum,
    );
  }

  @override
  void write(BinaryWriter writer, PartTime obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.partTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
