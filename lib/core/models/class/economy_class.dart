import 'package:hive/hive.dart';

part 'economy_class.g.dart';

@HiveType(typeId: 0)
class EconomyElement {
  EconomyElement({
    required this.id,
    required this.title,
    required this.count,
    required this.isSpending,
    required this.description,
    required this.date,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int count;
  @HiveField(3)
  String? description;
  @HiveField(4)
  DateTime? date;
  @HiveField(5)
  bool isSpending;
}
