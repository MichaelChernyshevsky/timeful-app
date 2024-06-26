// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_stat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerStatAdapter extends TypeAdapter<TimerStat> {
  @override
  final int typeId = 4;

  @override
  TimerStat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerStat(
      work: fields[0] as int,
      relax: fields[1] as int,
      history: fields[2] as History,
    );
  }

  @override
  void write(BinaryWriter writer, TimerStat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.work)
      ..writeByte(1)
      ..write(obj.relax)
      ..writeByte(2)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerStatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
