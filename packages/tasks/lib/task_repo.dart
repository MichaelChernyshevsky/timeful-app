import 'package:hive_flutter/hive_flutter.dart';

import 'models/task_class.dart';

class TaskRepo {
  late Box<TaskModel> boxTasks;

  static const String _boxTasks = 'boxTasks';

  Future init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskModelAdapter());
    }
    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxTasks);
    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
  }

  List<TaskModel> get({filter}) {
    // List<TaskModel> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }

    if (filter != null) {}
    return boxTasks.values.toList();
  }

  Future<bool> add({
    required TaskModel task,
  }) async {
    return (await boxTasks.add(task)) != -1;
  }

  Future edit({
    required TaskModel element,
    // required int index,
  }) async {
    // final elementIndex = task.id;
  }

  Future<bool> delete({
    required String id,
  }) async {
    final indexElement = getIndex(id: id, box: boxTasks);
    await boxTasks.deleteAt(indexElement);
    return true;
  }

  int getIndex({required String id, required Box box}) {
    for (var index = 0; index <= box.length; index += 1) {
      if (box.values.elementAt(index).id == id) {
        return index;
      }
    }
    return -1;
  }
}
