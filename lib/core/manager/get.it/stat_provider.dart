import 'package:app_with_apps/core/data/app_repo.dart';
import 'package:app_with_apps/core/func/stat_funcs.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class StatProvider extends ChangeNotifier {
  int _moneyAll = 0;
  int _income = 0;
  int _minutesInWork = 0;
  int _minutesInRelax = 0;
  int _doneTask = 0;
  int _undoneTask = 0;
  String _tasksDone = '';
  List<String> idList = [];

  Future<void> initStat() async {
    _moneyAll = await RepoInt().getData(key: RepoKeys.moneyAll);
    // _moneyYear = await RepoInt.getData(key: RepoKeys.moneyYear);
    // _moneyMounth = await RepoInt.getData(key: RepoKeys.moneyMounth);
    _income = await RepoInt().getData(key: RepoKeys.income);
    _minutesInWork = await RepoInt().getData(key: RepoKeys.minutesInWork);
    _minutesInRelax = await RepoInt().getData(key: RepoKeys.minutesInRelax);
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

  // int getMoneyYear() => _moneyYear;

  // int getMoneyMounthl() => _moneyMounth;

  int getIncome() => _income;

  int getWallet() => _moneyAll;

  int getMinutesInRelax() => _minutesInRelax;

  int getMinutesInWork() => _minutesInWork;

  int getDoneTask() => _doneTask;

  int getUnDoneTask() => _undoneTask;

  List<String> getTasksDone() {
    taskCheck();
    return getIdDone(str: _tasksDone);
  }

  int getMinuteInRelax() => _minutesInRelax;

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

  void increaseMinutesInWork({required int minute}) {
    _minutesInWork += minute;
    RepoInt().saveData(key: RepoKeys.minutesInWork, data: _minutesInWork);
  }

  void increaseMinutesInRelax({required int minute}) {
    _minutesInRelax += minute;
    RepoInt().saveData(key: RepoKeys.minutesInRelax, data: _minutesInRelax);
  }

  void setMoneyAll({required int money, required bool isSpending}) {
    if (isSpending) {
      _moneyAll -= money;
    } else {
      _moneyAll += money;
      _income += money;
      RepoInt().saveData(key: RepoKeys.income, data: _income);
    }

    RepoInt().saveData(key: RepoKeys.moneyAll, data: _moneyAll);
  }

  // void increaseMoneyYear({required int money}) {
  //    _moneyYear += money;

  // }
  // void decreaseMoneyYear({required int money}) {
  //   _moneyYear -= money;
  // }

  // void increaseMoneyMounth({required int money}) {
  //   _moneyMounth += money;
  //   _moneyAll += money;
  // }

  // void decreaseMoneyMounth({required int money}) {
  //   _moneyYear -= money;
  //   _moneyAll -= money;
  // }
}
