// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_time__enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartTimeEnumAdapter extends TypeAdapter<PartTimeEnum> {
  @override
  final int typeId = 3;

  @override
  PartTimeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PartTimeEnum.morning;
      case 1:
        return PartTimeEnum.day;
      case 2:
        return PartTimeEnum.evening;
      case 3:
        return PartTimeEnum.anyway;
      default:
        return PartTimeEnum.morning;
    }
  }

  @override
  void write(BinaryWriter writer, PartTimeEnum obj) {
    switch (obj) {
      case PartTimeEnum.morning:
        writer.writeByte(0);
        break;
      case PartTimeEnum.day:
        writer.writeByte(1);
        break;
      case PartTimeEnum.evening:
        writer.writeByte(2);
        break;
      case PartTimeEnum.anyway:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartTimeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
