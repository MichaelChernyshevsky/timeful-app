// ignore_for_file: type_annotate_public_apis, unnecessary_statements

import 'dart:async';

import 'package:app_with_apps/interface/func/timer.dart';
import 'package:app_with_apps/service/stat/stat.dart';
import 'package:app_with_apps/core/models/enum/timer_state.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/timer/widgets/widgets.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _timeWork = 1 * 60;
  int _timeRelax = 1 * 60;
  int timeWork = 0;
  int timeRelax = 0;
  TimerState timerState = TimerState.stop;
  bool isFirst = true;
  Timer? timer;

  String time = 'Stop';

  void onTapStart() => setState(() {
        timeWork = _timeWork;
        timeRelax = _timeRelax;
        timerState = TimerState.work;
        timerHandler();
      });

  void onTapStop() => setState(() {
        timerState = TimerState.stop;
        time = 'stop';
        timer?.cancel();
      });

  void timerHandler() {
    setState(() {
      timer?.cancel();
    });

    if (timerState == TimerState.relax) {
      timer = relaxTimer();
    } else {
      timer = workTimer();
    }
  }

  void change({required isWork, required isIncrease}) {
    setState(() {
      if (isWork) {
        if (isIncrease) {
          _timeWork += 60;
        } else {
          if (_timeWork > 0) {
            _timeWork -= 60;
          }
        }
      } else {
        if (isIncrease) {
          _timeRelax += 60;
        } else {
          if (_timeRelax > 0) {
            _timeRelax -= 60;
          }
        }
      }
    });
  }

  Timer workTimer() => Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          if (timeWork > 0) {
            timeWork -= 1;
            time = getNumber(timeWork);
          } else {
            timeWork = _timeWork;
            timerState = TimerState.relax;
            GetIt.I.get<StatService>().increaseMinutesInWork(minute: _timeWork ~/ 60);
            timerHandler();
          }
        });
      });

  Timer relaxTimer() => Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          if (timeRelax > 0) {
            timeRelax -= 1;
            time = getNumber(timeRelax);
          } else {
            timeRelax = _timeRelax;
            timerState = TimerState.work;
            GetIt.I.get<StatService>().increaseMinutesInRelax(minute: _timeRelax ~/ 60);
            timerHandler();
          }
        });
      });

  void setTimerForm(int index) {
    setState(() {
      _timeWork = 0;
      _timeRelax = 0;

      if (index == 1) {
        _timeWork = 30 * 60;
        _timeRelax = 10 * 60;
      } else if (index == 2) {
        _timeWork += 20 * 60;
        _timeRelax = 5 * 60;
      } else {
        _timeWork += 10 * 60;
        _timeRelax = 2 * 60;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.timer),
          Padding(
            padding: EdgeInsets.all(h * 0.02),
            child: Column(
              children: [
                Text(
                  time,
                  style: TextStyle(fontSize: h * 0.05),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.current.work,
                      style: TextStyle(fontSize: h * 0.03),
                    ),
                    // work
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundedButton(
                            isPlus: false,
                            size: h * 0.08,
                            color: Colors.purple,
                            tap: () => change(isIncrease: false, isWork: true),
                          ),
                          CustomText(text: (_timeWork / 60).toString()),
                          RoundedButton(
                            color: Colors.purple,
                            isPlus: true,
                            size: h * 0.08,
                            tap: () => change(isIncrease: true, isWork: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.current.relax,
                      style: TextStyle(fontSize: h * 0.03),
                    ),
                    // work
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundedButton(
                            color: Colors.purple,
                            isPlus: false,
                            size: h * 0.08,
                            tap: () => change(isIncrease: false, isWork: false),
                          ),
                          CustomText(text: (_timeRelax / 60).toString()),
                          RoundedButton(
                            color: Colors.purple,
                            isPlus: true,
                            size: h * 0.08,
                            tap: () => change(isIncrease: true, isWork: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeButton(
                  onTap: () => setTimerForm(1),
                  text: AppLocalizations.current.m30m10,
                ),
                TimeButton(
                  onTap: () => setTimerForm(2),
                  text: AppLocalizations.current.m20m5,
                ),
                TimeButton(
                  onTap: () => setTimerForm(3),
                  text: AppLocalizations.current.m10m2,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StartOrStop(isStart: true, onTap: onTapStart),
              StartOrStop(isStart: false, onTap: onTapStop),
            ],
          ),
        ],
      ),
    );
  }
}
