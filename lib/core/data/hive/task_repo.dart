import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskRepo {
  List<TaskElement> get({required Box<TaskElement> box}) {
    // List<TaskElement> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }

    return box.values.toList();
  }

  Future<bool> add({
    required Box<TaskElement> box,
    required TaskElement task,
  }) async {
    return (await box.add(task)) != -1;
  }

  // Future<bool> remove(TaskElement task) => money.delete().then((_) {
  //       return true;
  //     }).catchError((_) {
  //       return false;
  //     });

  Future wipeData({
    required Box<TaskElement> box,
  }) async {
    await Hive.deleteFromDisk();
    box = await Hive.openBox<TaskElement>(
      AppLocalizations.current.taskRepo,
    );
  }
}
