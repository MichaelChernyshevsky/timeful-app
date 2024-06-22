import 'package:hive/hive.dart';
import 'package:timer/stat/history.dart';

part 'timer_stat.g.dart';

@HiveType(typeId: 4)
class TimerStat {
  @HiveField(0)
  int work;
  @HiveField(1)
  int relax;
  @HiveField(2)
  History history;

  TimerStat({
    required this.work,
    required this.relax,
    required this.history,
  });

  TimerStat edit({required int work, required int relax, required History? history}) {
    return TimerStat(
      work: this.work + work,
      relax: this.relax + relax,
      history: history ?? this.history,
    );
  }

  factory TimerStat.empty() => TimerStat(work: 0, relax: 0, history: History(relax: 0, work: 0));
}
