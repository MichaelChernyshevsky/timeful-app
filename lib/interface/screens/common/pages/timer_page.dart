// ignore_for_file: type_annotate_public_apis, unnecessary_statements

import 'package:app_with_apps/core/func/timer.dart';
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
  Timer? timer;

  String time = 'Stop';

  void onTapStop() => setState(() {
        timerState = TimerState.stop;
        time = 'stop';

        timer?.cancel();
      });

  void change({required isWork, required isIncrease}) {
    setState(() {
      if (isWork) {
        if (isIncrease) {
          _timeWork += 60;
        } else {
          if (timeWork > 0) {
            _timeWork -= 60;
          }
        }
      } else {
        if (isIncrease) {
          _timeRelax += 60;
        } else {
          if (timeRelax > 0) {
            _timeRelax -= 60;
          }
        }
      }
    });
  }

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

  Timer workTimer() => Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          if (timeWork > 0) {
            timeWork -= 1;
            time = getNumber(timeWork);
          } else {
            timeWork = _timeWork;
            timerState = TimerState.relax;
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
            timerHandler();
          }
        });
      });

  void startTimer() => setState(() {
        timeWork = _timeWork;
        timeRelax = _timeRelax;
        timerState = TimerState.work;
        timerHandler();
      });

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          Padding(
            padding: getPadding(all: 20),
            child: Column(
              children: [
                CustomText(text: time),
                CustomText(text: AppLocalizations.current.work),
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
                CustomText(text: AppLocalizations.current.relax),
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
          CustomButton(
            padding: getPadding(all: 20),
            color: UTILSConstants.done,
            tap: startTimer,
            text: AppLocalizations.current.start,
          ),
          CustomButton(
            padding: getPadding(all: 20),
            color: UTILSConstants.undone,
            tap: onTapStop,
            text: AppLocalizations.current.stop,
          ),
        ],
      ),
    );
  }
}
