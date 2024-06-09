import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/stat/model/task_stat.dart';
import 'package:tasks/tasks.dart';

import 'models/task_class.dart';

class TaskRepo {
  late Box<TaskModel> boxTasks;
  late Box<TaskStat> boxTasksStat;

  static const String _boxTasks = 'boxTasks';
  static const String _boxTasksStat = 'boxTasksStat';

  Future init() async {
    if (!Hive.isAdapterRegistered(2)) {}
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(TaskStatAdapter());

    print(Hive.isAdapterRegistered(3));
    if (!Hive.isAdapterRegistered(3)) {}
    await initializeStat();

    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
  }

  Future initializeStat() async {
    boxTasksStat = await Hive.openBox<TaskStat>(_boxTasksStat);

    if (boxTasksStat.values.toList().isEmpty) {
      boxTasksStat.add(TaskStat.empty());
    }
  }

  TaskStat get stat => boxTasksStat.values.first;

  Future changeStat({
    required int done,
    required int undone,
    required String history,
  }) async {
    final statModel = boxTasksStat.values.first.edit(done: done, undone: undone, history: history);
    boxTasksStat.deleteAt(0);
    boxTasksStat.add(statModel);
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxTasks);
    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
    await initializeStat();
  }

  List<TaskModel> get() {
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
