import 'package:app_with_apps/core/data/app_repo.dart';
import 'package:app_with_apps/core/func/stat_funcs.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class StatProvider extends ChangeNotifier {
  int _moneyAll = 0;

  int _income = 0;

  int _minutesInWork = 0;

  String _tasksDone = '';

  Future<void> initStat() async {
    _moneyAll = await RepoInt().getData(key: RepoKeys.moneyAll);
    // _moneyYear = await RepoInt.getData(key: RepoKeys.moneyYear);
    // _moneyMounth = await RepoInt.getData(key: RepoKeys.moneyMounth);
    _income = await RepoInt().getData(key: RepoKeys.income);
    _minutesInWork = await RepoInt().getData(key: RepoKeys.minutesInWork);
    _tasksDone = await RepoString().getData(key: RepoKeys.doneTasks);
    taskCheck();
  }

  void taskCheck() {
    if (!checkDate(str: _tasksDone)) {
      _tasksDone = '${getDate()}-date-';
    }
  }

  // int getMoneyYear() => _moneyYear;

  // int getMoneyMounthl() => _moneyMounth;

  int getIncome() => _income;

  int getMinutesInWork() => _minutesInWork;

  String getTasksDone() {
    taskCheck();
    return _tasksDone;
  }

  void setTaskDone({required String id}) {
    _tasksDone += '-$id';
    RepoString().saveData(key: RepoKeys.doneTasks, data: _tasksDone);
  }

  void increaseMinutesInWork({required int minute}) {
    _minutesInWork += minute;
    RepoInt().saveData(key: RepoKeys.minutesInWork, data: _minutesInWork);
  }

  void increaseIncome({required int money}) {
    _income += money;
    RepoInt().saveData(key: RepoKeys.income, data: _income);
  }

  void setMoneyAll({required int money}) {
    _moneyAll += money;
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

  void setMinutesInWork({required int minute}) => _minutesInWork += minute;
}
