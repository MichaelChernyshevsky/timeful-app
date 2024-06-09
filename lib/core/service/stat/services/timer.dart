import 'package:app_with_apps/core/service/stat/repo.dart';

class TimerStatService {
  int _minutesInWork = 0;
  int _minutesInRelax = 0;

  Future<void> initStat() async {
    _minutesInWork = await RepoInt().getData(key: RepoKeys.minutesInWork);
    _minutesInRelax = await RepoInt().getData(key: RepoKeys.minutesInRelax);
  }

  int getMinutesInRelax() => _minutesInRelax;

  int getMinutesInWork() => _minutesInWork;

  int getMinuteInRelax() => _minutesInRelax;

  void increaseMinutesInWork({required int minute}) {
    _minutesInWork += minute;
    RepoInt().saveData(key: RepoKeys.minutesInWork, data: _minutesInWork);
  }

  void increaseMinutesInRelax({required int minute}) {
    _minutesInRelax += minute;
    RepoInt().saveData(key: RepoKeys.minutesInRelax, data: _minutesInRelax);
  }
}
