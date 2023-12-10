import 'package:app_with_apps/core/models/class/economy_class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ServiceHive {
  late Box<TaskElement> boxTasks;
  late Box<EconomyElement> boxEconomy;

  static const String _boxTasks = 'boxTasks';
  static const String _boxEconomy = 'boxEconomy';

  Future initApp() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskElementAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(EconomyElementAdapter());
    }
  }
}
