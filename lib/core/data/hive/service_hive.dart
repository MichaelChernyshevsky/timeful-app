import 'package:app_with_apps/core/data/hive/economy_repo.dart';
import 'package:app_with_apps/core/data/hive/task_repo.dart';
import 'package:app_with_apps/core/models/class/economy_class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServiceHive {
  int getIndex({required int id, required Box box}) {
    for (var index = 0; index <= box.length; index += 1) {
      if (box.values.elementAt(index).id == id) {
        return index;
      }
    }
    return -1;
  }

  Future addTask({required TaskElement element}) =>
      GetIt.I.get<TaskRepo>().add(task: element);

  Future addEconomy({required EconomyElement element}) =>
      GetIt.I.get<EconomyRepo>().add(element: element);

  Future wipeAll() async {
    await GetIt.I.get<EconomyRepo>().wipe();
    await GetIt.I.get<TaskRepo>().wipe();
  }

  Future wipeEconomy() async => GetIt.I.get<EconomyRepo>().wipe();
  Future wipeTasks() async => GetIt.I.get<TaskRepo>().wipe();
  //  Future wipeTasks() async

  Future<List<TaskElement>> getTasks() async => GetIt.I.get<TaskRepo>().get();

  List<EconomyElement> getEconomy() {
    return GetIt.I.get<EconomyRepo>().get();
  }

  Future editEconomy({required EconomyElement element}) async =>
      GetIt.I.get<EconomyRepo>().edit(
            element: element,
            // index: getIndex(box: boxEconomy, id: element.id),
          );

  Future editTask({required TaskElement element}) async =>
      GetIt.I.get<TaskRepo>().edit(
            element: element,
            // index: getIndex( id: element.id),
          );
}
