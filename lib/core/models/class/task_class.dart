// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:hive/hive.dart';

part 'task_class.g.dart';

@HiveType(typeId: 1)
class TaskElement {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  Icon icon;
  @HiveField(3)
  Color? color;
  @HiveField(4)
  int countOnDay;
  @HiveField(5)
  int count;
  @HiveField(6)
  PartTime timeOfDay;

  TaskElement({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.countOnDay,
    required this.count,
    required this.timeOfDay,
  });
}
