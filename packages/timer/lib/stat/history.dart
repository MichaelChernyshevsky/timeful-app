import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 5)
class History {
  @HiveField(0)
  int work;
  @HiveField(1)
  int relax;

  History({
    required this.work,
    required this.relax,
  });

  History edit({required int work, required int relax}) {
    return History(work: this.work + work, relax: this.relax + relax);
  }

  factory History.empty() => History(work: 0, relax: 0);
}
