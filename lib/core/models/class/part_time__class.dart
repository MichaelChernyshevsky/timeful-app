// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
import 'package:hive/hive.dart';

part 'part_time__class.g.dart';

@HiveType(typeId: 2)
class PartTime {
  @HiveField(0)
  int index;
  @HiveField(1)
  PartTimeEnum partTime;

  PartTime({
    required this.index,
    required this.partTime,
  });
}
