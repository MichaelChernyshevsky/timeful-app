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
      id: fields[0] as int,
      title: fields[1] as String,
      icon: fields[2] as Icon,
      color: fields[3] as Color?,
      countOnDay: fields[4] as int,
      count: fields[5] as int,
      timeOfDay: fields[6] as PartTime,
    );
  }

  @override
  void write(BinaryWriter writer, TaskElement obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.countOnDay)
      ..writeByte(5)
      ..write(obj.count)
      ..writeByte(6)
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
