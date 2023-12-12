import 'package:hive/hive.dart';

part 'part_time__enum.g.dart';

@HiveType(typeId: 3)
enum PartTimeEnum {
  @HiveField(0)
  morning,
  @HiveField(1)
  day,
  @HiveField(2)
  evening,
  @HiveField(3)
  anyway,
}
