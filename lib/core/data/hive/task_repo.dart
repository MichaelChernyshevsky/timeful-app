import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskRepo {
  List<TaskElement> get({required Box<TaskElement> box, filter}) {
    // List<TaskElement> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }

    if (filter != null) {}
    return box.values.toList();
  }

  Future<bool> add({
    required Box<TaskElement> box,
    required TaskElement task,
  }) async {
    return (await box.add(task)) != -1;
  }

  Future edit({
    required Box<TaskElement> box,
    required TaskElement element,
    required int index,
  }) async {
    // final elementIndex = task.id;
  }

  Future<bool> remove({
    required int id,
    required Box<TaskElement> box,
  }) async {
    return true;
  }
}
