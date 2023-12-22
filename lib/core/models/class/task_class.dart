// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:hive/hive.dart';

part 'task_class.g.dart';

@HiveType(typeId: 1)
class TaskElement {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;

  // @HiveField(2)
  // Color? color;
  @HiveField(2)
  int countOnDay;
  @HiveField(3)
  int count;
  @HiveField(4)
  PartTime timeOfDay;
  @HiveField(5)
  bool isDone;

  TaskElement({
    required this.id,
    required this.title,
    // required this.color,
    required this.countOnDay,
    required this.count,
    required this.timeOfDay,
    required this.isDone,
  });
}
