// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskElementAdapter extends TypeAdapter<TaskElement> {
  @override
  final int typeId = 1;

  @override
  TaskElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskElement(
      id: fields[0] as String,
      title: fields[1] as String,
      countOnDay: fields[2] as int,
      count: fields[3] as int,
      timeOfDay: fields[4] as PartTime,
    );
  }

  @override
  void write(BinaryWriter writer, TaskElement obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.countOnDay)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.timeOfDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
