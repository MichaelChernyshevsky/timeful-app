import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskRepo {
  late Box<TaskElement> boxTasks;

  static const String _boxTasks = 'boxTasks';

  Future init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskElementAdapter());
      boxTasks = await Hive.openBox<TaskElement>(_boxTasks);
    }
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxTasks);
    boxTasks = await Hive.openBox<TaskElement>(_boxTasks);
  }

  List<TaskElement> get({filter}) {
    // List<TaskElement> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }

    if (filter != null) {}
    return boxTasks.values.toList();
  }

  Future<bool> add({
    required TaskElement task,
  }) async {
    return (await boxTasks.add(task)) != -1;
  }

  Future edit({
    required TaskElement element,
    // required int index,
  }) async {
    // final elementIndex = task.id;
  }

  Future<bool> remove({
    required int id,
  }) async {
    return true;
  }
}
