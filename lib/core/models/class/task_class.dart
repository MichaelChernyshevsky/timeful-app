// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TaskElement {
  int id;
  String title;
  Icon icon;
  Color? color;
  int countOnDay;
  int count;
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
