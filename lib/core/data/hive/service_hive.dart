import 'package:app_with_apps/core/data/hive/economy_repo.dart';
import 'package:app_with_apps/core/data/hive/task_repo.dart';
import 'package:app_with_apps/core/models/class/economy_class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServiceHive {
  late Box<TaskElement> boxTasks;
  late Box<EconomyElement> boxEconomy;

  static const String _boxTasks = 'boxTasks';
  static const String _boxEconomy = 'boxEconomy';

  final economyRepo = EconomyRepo();
  final taskRepo = TaskRepo();

  List<TaskElement> tasks = [];
  List<EconomyElement> economy = [];

  Future initApp() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskElementAdapter());
      boxTasks = await Hive.openBox<TaskElement>(_boxTasks);
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(EconomyElementAdapter());
      boxEconomy = await Hive.openBox<EconomyElement>(_boxEconomy);
    }
  }

  int getIndex({required int id, required Box box}) {
    for (var index = 0; index <= box.length; index += 1) {
      if (box.values.elementAt(index).id == id) {
        return index;
      }
    }
    return -1;
  }

  Future addTask({required TaskElement element}) =>
      taskRepo.add(box: boxTasks, task: element);

  Future addEconomy({required EconomyElement element}) =>
      economyRepo.add(box: boxEconomy, element: element);

  Future wipeAll() async {
    await wipeEconomy();
    await wipeTasks();
  }

  Future wipeTasks() async {
    await Hive.deleteBoxFromDisk(_boxTasks);
    boxTasks = await Hive.openBox<TaskElement>(_boxTasks);
  }

  Future wipeEconomy() async {
    await Hive.deleteBoxFromDisk(_boxEconomy);
    boxEconomy = await Hive.openBox<EconomyElement>(_boxEconomy);
  }

  Future getTasks() async {}

  Future getEconomy() async {}

  Future editEconomy({required EconomyElement element}) async =>
      economyRepo.edit(
        box: boxEconomy,
        element: element,
        index: getIndex(box: boxEconomy, id: element.id),
      );

  Future editTask({required TaskElement element}) async => taskRepo.edit(
        box: boxTasks,
        element: element,
        index: getIndex(box: boxTasks, id: element.id),
      );
}
