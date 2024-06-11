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

  ////////
  final int _timeWork = 1 * 60;
  final int _timeRelax = 1 * 60;
  int timeWork = 0;
  int timeRelax = 0;
  TimerState timerState = TimerState.stop;
  bool isFirst = true;
  Timer? timer;
  String time = 'Stop';

  void startTimer({required int work, required int relax}) {
    timeWork = _timeWork;
    timeRelax = _timeRelax;
    changeHistory(work: _timeWork, relax: _timeRelax);
    timerState = TimerState.work;
    timerHandler();
    notifyListeners();
  }

  void get stop {
    timerState = TimerState.stop;
    time = 'stop';
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

  Timer workTimer() => Timer.periodic(const Duration(seconds: 1), (_) {
        if (timeWork > 0) {
          timeWork -= 1;
          time = getNumber(timeWork);
        } else {
          timeWork = _timeWork;
          timerState = TimerState.relax;
          addTimeWork(_timeWork ~/ 60);
          timerHandler();
        }
      });

  Timer relaxTimer() => Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          if (timeRelax > 0) {
            timeRelax -= 1;
            time = getNumber(timeRelax);
          } else {
            timeRelax = _timeRelax;
            timerState = TimerState.work;
            addTimeRelax(_timeRelax ~/ 60);
            timerHandler();
          }
        },
      );
}
