// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'task_stat.g.dart';

@HiveType(typeId: 3)
class TaskStat {
  @HiveField(0)
  int done;
  @HiveField(1)
  int undone;
  @HiveField(2)
  String history;

  TaskStat({
    required this.done,
    required this.undone,
    required this.history,
  });

  TaskStat edit({required int done, required int undone, required String history}) {
    return TaskStat(done: this.done + done, undone: this.undone + undone, history: this.history + history);
  }

  TaskStat wipeHistory() => TaskStat(done: done, undone: undone, history: '');

  factory TaskStat.empty() => TaskStat(done: 0, undone: 0, history: '');
}
