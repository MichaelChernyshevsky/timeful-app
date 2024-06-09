import 'package:app_with_apps/core/service/stat/services/timer.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/core/service/stat/funcs.dart';
import 'package:app_with_apps/core/service/stat/repo.dart';
import 'package:app_with_apps/core/service/stat/services/economy.dart';

class StatService extends ChangeNotifier {
  final TimerStatService _timer = TimerStatService();
  EconomyStatService get economy => EconomyStatService();
  TimerStatService get timer => _timer;

  int _doneTask = 0;
  int _undoneTask = 0;
  String _tasksDone = '';
  List<String> idList = [];

  Future<void> initStat() async {
    await _timer.initStat();
    _tasksDone = await RepoString().getData(key: RepoKeys.doneTasks);
    _doneTask = await RepoInt().getData(key: RepoKeys.doneTask);
    _undoneTask = await RepoInt().getData(key: RepoKeys.undoneTask);

    taskCheck();
  }

  void taskCheck() {
    if (!checkDate(str: _tasksDone)) {
      updateTaskDoneString(idList);
    } else {
      idList = getIdDone(str: _tasksDone);
    }
  }

  void updateTaskDoneString(List<String> list) {
    _tasksDone = '';
    _tasksDone = '${getDate()}*****date*****';
    _tasksDone += getStr(idList: list);
  }

  int getDoneTask() => _doneTask;

  int getUnDoneTask() => _undoneTask;

  List<String> getTasksDone() {
    taskCheck();
    return getIdDone(str: _tasksDone);
  }

  int getTask({required bool isDone}) {
    if (isDone) {
      return _doneTask;
    } else {
      return _undoneTask;
    }
  }

  void setTask({required bool isDone, required bool withMinus}) {
    if (isDone) {
      // _doneTask += 1;
      RepoInt().saveData(key: RepoKeys.doneTask, data: _doneTask);
      if (withMinus) {
        // _undoneTask -= 1;
        RepoInt().saveData(key: RepoKeys.undoneTask, data: _undoneTask);
      }
    } else {
      // _undoneTask += 1;
      RepoInt().saveData(key: RepoKeys.undoneTask, data: _undoneTask);
      if (withMinus) {
        // _doneTask -= 1;
        RepoInt().saveData(key: RepoKeys.doneTask, data: _doneTask);
      }
    }
  }

  void setTaskDone({required String id}) {
    if (!checkIDInList(id: id, idList: idList)) {
      _tasksDone += '*****$id';
      idList.add(id);
      updateTaskDoneString(idList);

      _doneTask += 1;
      if (_undoneTask > 0) {
        _undoneTask -= 1;
      }
    }

    RepoString().saveData(key: RepoKeys.doneTasks, data: _tasksDone);
    setTask(isDone: true, withMinus: true);
  }

  void setTaskUndone({required String id}) {
    idList = deleteId(idList: idList, id: id);
    updateTaskDoneString(idList);

    _doneTask -= 1;
    _undoneTask += 1;

    RepoString().saveData(key: RepoKeys.doneTasks, data: _tasksDone);
    setTask(isDone: false, withMinus: true);
  }
}
