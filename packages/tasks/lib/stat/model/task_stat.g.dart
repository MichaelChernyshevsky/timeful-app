// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_stat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatAdapter extends TypeAdapter<TaskStat> {
  @override
  final int typeId = 3;

  @override
  TaskStat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskStat(
      done: fields[0] as int,
      undone: fields[1] as int,
      history: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskStat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.done)
      ..writeByte(1)
      ..write(obj.undone)
      ..writeByte(2)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
