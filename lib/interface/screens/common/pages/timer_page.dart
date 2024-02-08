// ignore_for_file: type_annotate_public_apis, unnecessary_statements

import 'package:app_with_apps/core/func/timer.dart';
import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/core/models/enum/timer_state.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';

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
            GetIt.I
                .get<StatProvider>()
                .increaseMinutesInWork(minute: _timeWork ~/ 60);
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
            GetIt.I
                .get<StatProvider>()
                .increaseMinutesInRelax(minute: _timeRelax ~/ 60);
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
    return Body(
      widget: Column(
        children: [
          const Spacer(),
          Padding(
            padding: getPadding(all: 20),
            child: Column(
              children: [
                CustomText(
                  text: time,
                  fontSize: TextEnum.title,
                ),

                CustomText(
                  text: AppLocalizations.current.work,
                  color: UTILSConstants.grey,
                ),
                // work
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      padding: getPadding(all: 20),
                      color: UTILSConstants.undone,
                      tap: () => change(isIncrease: false, isWork: true),
                      text: AppLocalizations.current.minus,
                    ),
                    CustomText(text: (_timeWork / 60).toString()),
                    CustomButton(
                      padding: getPadding(all: 20),
                      color: UTILSConstants.undone,
                      tap: () => change(isIncrease: true, isWork: true),
                      text: AppLocalizations.current.plus,
                    ),
                  ],
                ),
                CustomText(
                    text: AppLocalizations.current.relax,
                    color: UTILSConstants.grey),
                // relax
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      padding: getPadding(all: 20),
                      color: UTILSConstants.undone,
                      tap: () => change(isIncrease: false, isWork: false),
                      text: AppLocalizations.current.minus,
                    ),
                    CustomText(text: (_timeRelax / 60).toString()),
                    CustomButton(
                      padding: getPadding(all: 20),
                      color: UTILSConstants.undone,
                      tap: () => change(isIncrease: true, isWork: false),
                      text: AppLocalizations.current.plus,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.m30m10,
                tap: () => setTimerForm(1),
              ),
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.m20m5,
                tap: () => setTimerForm(2),
              ),
              CustomButton(
                color: UTILSConstants.white,
                text: AppLocalizations.current.m10m2,
                tap: () => setTimerForm(3),
              ),
            ],
          ),
          CustomButton(
            padding: getPadding(all: 20),
            color: UTILSConstants.done,
            tap: onTapStart,
            text: AppLocalizations.current.start,
          ),
          CustomButton(
            padding: getPadding(all: 20),
            color: UTILSConstants.undone,
            tap: onTapStop,
            text: AppLocalizations.current.stop,
          ),
          const Spacer(),
          CustomText(text: AppLocalizations.current.timerError),
          const Spacer(),
        ],
      ),
    );
  }
}
