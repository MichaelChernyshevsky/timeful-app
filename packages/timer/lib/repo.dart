import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/func.dart';
import 'package:timer/stat/history.dart';
import 'package:timer/stat/timer_stat.dart';

enum TimerState {
  work,
  stop,
  relax,
}

class TimerModel {
  final String title;
  final int timeRelax;
  final int timeWork;

  TimerModel({
    required this.title,
    required this.timeRelax,
    required this.timeWork,
  });
}

class TimerRepo extends ChangeNotifier {
  late Box<TimerStat> boxStat;

  static const String _boxTimerStat = 'boxTimerStat';

  Future init() async {
    Hive.registerAdapter(TimerStatAdapter());
    Hive.registerAdapter(HistoryAdapter());

    await initializeStat();

    boxStat = await Hive.openBox<TimerStat>(_boxTimerStat);
  }

  Future initializeStat() async {
    boxStat = await Hive.openBox<TimerStat>(_boxTimerStat);

    if (boxStat.values.toList().isEmpty) {
      boxStat.add(TimerStat.empty());
    }
  }

  String get relax {
    const String min = 'm';
    const String hour = 'h';

    final relax = stat.relax;
    if (relax < 60) {
      return '$relax $min';
    } else {
      final hours = relax / 60;
      final minutes = relax % 60;
      if (minutes == 0) {
        return '$hours $hour';
      } else {
        return '$hours $hour $minutes $min';
      }
    }
  }

  String get work {
    const String min = 'm';
    const String hour = 'h';

    final work = stat.work;
    if (work < 60) {
      return '$work $min';
    } else {
      final hours = work / 60;
      final minutes = work % 60;
      if (minutes == 0) {
        return '$hours $hour';
      } else {
        return '$hours $hour $minutes $min';
      }
    }
  }

  TimerStat get stat => boxStat.values.first;
  History get history => boxStat.values.first.history;

  ////////
  StreamController<TimerModel> timeModel = StreamController<TimerModel>.broadcast();

  void addTimeWork(int time) {
    final newStat = boxStat.values.first.edit(work: time, relax: 0, history: null);
    boxStat.deleteAt(0);
    boxStat.add(newStat);
  }

  void addTimeRelax(int time) {
    final newStat = boxStat.values.first.edit(work: 0, relax: time, history: null);
    boxStat.deleteAt(0);
    boxStat.add(newStat);
  }

  void changeHistory({required int work, required int relax}) {
    final newStat = boxStat.values.first.edit(work: 0, relax: 0, history: History(work: work, relax: relax));
    boxStat.deleteAt(0);
    boxStat.add(newStat);
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxTimerStat);
    boxStat = await Hive.openBox<TimerStat>(_boxTimerStat);
    await initializeStat();
  }

  int tw = 1 * 60;
  int tr = 1 * 60;
  int timeWork = 0;
  int timeRelax = 0;
  TimerState timerState = TimerState.stop;
  bool isFirst = true;
  Timer? timer;

  void startTimer() {
    timeWork = tw;
    timeRelax = tr;
    changeHistory(work: tw, relax: tr);
    timerState = TimerState.work;
    timerHandler();
  }

  void get stop {
    timerState = TimerState.stop;
    timeModel.add(TimerModel(title: 'stop', timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));

    timer?.cancel();
  }

  void onTapStart() {}

  void timerHandler() {
    timer?.cancel();

    if (timerState == TimerState.relax) {
      timer = relaxTimer();
    } else {
      timer = workTimer();
    }
  }

  void change({required isWork, required isIncrease}) {
    if (isWork) {
      if (isIncrease) {
        tw += 60;
      } else {
        if (tw > 0) {
          tw -= 60;
        }
      }
    } else {
      if (isIncrease) {
        tr += 60;
      } else {
        if (tr > 0) {
          tr -= 60;
        }
      }
    }
    timeModel.add(TimerModel(title: 'stop', timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
  }

  Timer workTimer() => Timer.periodic(const Duration(seconds: 1), (_) {
        if (timeWork > 0) {
          timeWork -= 1;

          // time = Stream.value(getNumber(timeWork));
          timeModel.add(TimerModel(title: getNumber(timeWork), timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
        } else {
          timeWork = tw;
          timerState = TimerState.relax;
          addTimeWork(tw ~/ 60);
          timerHandler();
        }
        notifyListeners();
      });

  Timer relaxTimer() => Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          if (timeRelax > 0) {
            timeRelax -= 1;
            // time = Stream.value(getNumber(timeRelax));
            timeModel.add(TimerModel(title: getNumber(timeRelax), timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
          } else {
            timeRelax = tr;
            timerState = TimerState.work;
            addTimeRelax(tr ~/ 60);
            timerHandler();
          }
          notifyListeners();
        },
      );

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
    timeModel.add(TimerModel(title: 'stop', timeRelax: (tr / 60).round(), timeWork: (tw / 60).round()));
  }
}
