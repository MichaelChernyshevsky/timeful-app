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
  String date;
  @HiveField(3)
  List<String> doneList;

  TaskStat({
    required this.done,
    required this.undone,
    required this.date,
    required this.doneList,
  });

  TaskStat wipeHistory({required int done, required int undone, required String date}) => TaskStat(
        done: this.done + done,
        undone: this.undone + undone,
        date: date,
        doneList: [],
      );

  factory TaskStat.empty() => TaskStat(
        done: 0,
        undone: 0,
        date: '',
        doneList: [],
      );
}
