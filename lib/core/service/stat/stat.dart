import 'package:app_with_apps/core/service/stat/services/tasks.dart';
import 'package:app_with_apps/core/service/stat/services/timer.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/core/service/stat/funcs.dart';
import 'package:app_with_apps/core/service/stat/repo.dart';
import 'package:app_with_apps/core/service/stat/services/economy.dart';

class StatService extends ChangeNotifier {
  EconomyStatService get economy => EconomyStatService();
  TasksStatService get tasks => TasksStatService();
  TimerStatService get timer => TimerStatService();
}
