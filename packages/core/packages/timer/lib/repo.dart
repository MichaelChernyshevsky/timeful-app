import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/func.dart';
import 'package:timer/interface.dart';
import 'package:timer/model.dart';

import 'package:helpers/common/repository.dart';
import 'package:helpers/tools/internet.dart';

import 'package:timer/uri.dart';

enum TimerState {
  work,
  stop,
  relax,
}

class Connector {
  final String title;
  final int timeRelax;
  final int timeWork;

  Connector({
    required this.title,
    required this.timeRelax,
    required this.timeWork,
  });
}

Map<String, dynamic> isolateEmpty = {
  "editHistory": {"work": 0, "relax": 0},
  "editStat": {
    "timeWork": 0,
    "timeRelax": 0,
  }
};

class TimerRepository extends ChangeNotifier implements Repository, TimerInterface {
  TimerRepository({required this.httpService});

  @override
  final HttpService httpService;

  StreamController<Connector> timeModel = StreamController<Connector>.broadcast();

  int tw = 0 * 60;
  int tr = 0 * 60;
  int timeWork = 0;
  int timeRelax = 0;
  TimerState timerState = TimerState.stop;
  Timer? timer;
  Map<String, dynamic> isolate = {
    "editHistory": {"work": 0, "relax": 0},
    "editStat": {
      "timeWork": 0,
      "timeRelax": 0,
    }
  };

  void refresh({required String userId}) {}

  Future initializeStat() async {}

  // String get relax {
  // const String min = 'm';
  // const String hour = 'h';

  // if (relax < 60) {
  //   return '$relax $min';
  // } else {
  //   final hours = relax / 60;
  //   final minutes = relax % 60;
  //   if (minutes == 0) {
  //     return '$hours $hour';
  //   } else {
  //     return '$hours $hour $minutes $min';
  //   }
  // }
  // }

  // String get work {
  //   const String min = 'm';
  //   const String hour = 'h';

  //   final work = stat.work;
  //   if (work < 60) {
  //     return '$work $min';
  //   } else {
  //     final hours = work / 60;
  //     final minutes = work % 60;
  //     if (minutes == 0) {
  //       return '$hours $hour';
  //     } else {
  //       return '$hours $hour $minutes $min';
  //     }
  //   }
  // }

  Future wipe() async {}

  void change({required isWork, required isIncrease, required work, required relax}) {
    work = int.parse(work) * 60;
    relax = int.parse(relax) * 60;
    if (isWork) {
      if (isIncrease) {
        work += 60;
      } else {
        if (work > 0) {
          work -= 60;
        }
      }
    } else {
      if (isIncrease) {
        relax += 60;
      } else {
        if (relax > 0) {
          relax -= 60;
        }
      }
    }
    timeModel.add(Connector(title: 'stop', timeRelax: (relax / 60).round(), timeWork: (work / 60).round()));
  }

  void setTimerForm(int index) {
    tw = 0;
    tr = 0;
    if (index == 1) {
      tw = 30 * 60;
      tr = 10 * 60;
    } else if (index == 2) {
      tw += 20 * 60;
      tr = 5 * 60;
    } else {
      tw += 10 * 60;
      tr = 2 * 60;
    }
    timeModel.add(
      Connector(
        title: 'stop',
        timeRelax: (tr / 60).round(),
        timeWork: (tw / 60).round(),
      ),
    );
  }

  Duration get duration => const Duration(seconds: 1);
  @override
  Future<bool> editTimerHistoryApi({required String userId, required String work, required String relax}) async {
    final BaseResponse resp = await httpService.patch(
      timerEditHistory,
      data: {
        "userId": userId,
        "work": work,
        "relax": relax,
      },
    );
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<bool> editTimerStatApi({required String userId, required String timeWork, required String timeRelax}) async {
    final BaseResponse resp = await httpService.patch(timerEditStat, data: {
      "userId": userId,
      "timeWork": timeWork,
      "timeRelax": timeRelax,
    });
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<TimerModel> getTimerApi({required String userId}) async {
    final BaseResponse resp = await httpService.post(timerGet, data: {"userId": userId});
    return TimerModel.fromJson(json: resp.data);
  }

  void action({required bool start, required String userId}) {
    Future<void> sendHistory({required String userId, required String work, required String relax}) async {
      if (await internetConnected) {
        editTimerHistoryApi(
          relax: (int.parse(isolate['editHistory']['relax']) + int.parse(relax)).toString(),
          work: (int.parse(isolate['editHistory']['work']) + int.parse(work)).toString(),
          userId: userId,
        );
        isolate['editHistory'] = isolateEmpty['editHistory'];
      } else {
        isolate['editHistory']['work'] += int.parse(work);
        isolate['editHistory']['relax'] += int.parse(relax);
      }
    }

    Future<void> sendStat({required String userId, required String timeWork, required String timeRelax}) async {
      if (await internetConnected) {
        editTimerStatApi(
          userId: userId,
          timeWork: (int.parse(isolate['editStat']['timeWork']) + int.parse(timeWork)).toString(),
          timeRelax: (int.parse(isolate['editStat']['timeRelax']) + int.parse(timeRelax)).toString(),
        );
        isolate['editStat'] = isolateEmpty['editStat'];
      } else {
        isolate['editStat']['timeWork'] += int.parse(timeWork);
        isolate['editStat']['timeRelax'] += int.parse(timeRelax);
      }
    }

    void addTimeWork(int time) {
      sendStat(timeRelax: '', timeWork: time.toString(), userId: userId);
    }

    void addTimeRelax(int time) {
      sendStat(timeRelax: time.toString(), timeWork: '', userId: userId);
    }

    void changeHistory({required int work, required int relax}) {
      sendHistory(relax: relax.toString(), work: work.toString(), userId: userId);
    }

    void timerHandler() {
      Timer workTimer() => Timer.periodic(duration, (_) {
            if (timeWork > 0) {
              timeWork -= 1;
              timeModel.add(Connector(title: getNumber(timeWork), timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
            } else {
              timeWork = tw;
              timerState = TimerState.relax;
              addTimeWork(tw ~/ 60);
              timerHandler();
            }
            notifyListeners();
          });
      Timer relaxTimer() => Timer.periodic(
            duration,
            (_) {
              if (timeRelax > 0) {
                timeRelax -= 1;
                timeModel.add(Connector(title: getNumber(timeRelax), timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
              } else {
                timeRelax = tr;
                timerState = TimerState.work;
                addTimeRelax(tr ~/ 60);
                timerHandler();
              }
              notifyListeners();
            },
          );

      timer?.cancel();
      if (timerState == TimerState.relax) {
        timer = relaxTimer();
      } else {
        timer = workTimer();
      }
    }

    if (start) {
      timeWork = tw;
      timeRelax = tr;
      changeHistory(work: tw, relax: tr);
      timerState = TimerState.work;
      timerHandler();
    } else {
      timerState = TimerState.stop;
      timeModel.add(Connector(title: 'stop', timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
      timer?.cancel();
    }
  }
}