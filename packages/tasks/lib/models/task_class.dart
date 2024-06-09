// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'task_class.g.dart';

@HiveType(typeId: 2)
class TaskModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int countOnDay;
  @HiveField(3)
  int count;

  @HiveField(4)
  bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    // required this.color,
    required this.countOnDay,
    required this.count,
    required this.isDone,
  });
}
