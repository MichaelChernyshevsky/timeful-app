// ignore_for_file: type_annotate_public_apis, unnecessary_statements, lines_longer_than_80_chars
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/timer/widgets/widgets.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.timer),
          Padding(
            padding: EdgeInsets.all(h * 0.02),
            child: Column(
              children: [
                StreamBuilder<TimerModel>(
                  stream: GetIt.I.get<TimerRepo>().timeModel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.title,
                        style: TextStyle(fontSize: h * 0.05),
                      );
                    } else {
                      return Text(
                        'stop',
                        style: TextStyle(fontSize: h * 0.05),
                      );
                    }
                  },
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
                      child: StreamBuilder<TimerModel>(
                        stream: GetIt.I.get<TimerRepo>().timeModel.stream,
                        builder: (context, snapshot) {
                          final relax = snapshot.hasData ? snapshot.data!.timeRelax.toString() : (GetIt.I.get<TimerRepo>().history.relax / 60).round().toString();
                          final work = snapshot.hasData ? snapshot.data!.timeWork.toString() : (GetIt.I.get<TimerRepo>().history.work / 60).round().toString();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundedButton(
                                isPlus: false,
                                size: h * 0.08,
                                color: Colors.purple,
                                tap: () => GetIt.I.get<TimerRepo>().change(isIncrease: false, isWork: true, work: work, relax: relax),
                              ),
                              CustomText(text: work),
                              RoundedButton(
                                color: Colors.purple,
                                isPlus: true,
                                size: h * 0.08,
                                tap: () => GetIt.I.get<TimerRepo>().change(isIncrease: true, isWork: true, work: work, relax: relax),
                              ),
                            ],
                          );
                        },
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
                      child: StreamBuilder<TimerModel>(
                        stream: GetIt.I.get<TimerRepo>().timeModel.stream,
                        builder: (context, snapshot) {
                          final relax = snapshot.hasData ? snapshot.data!.timeRelax.toString() : (GetIt.I.get<TimerRepo>().history.relax / 60).round().toString();
                          final work = snapshot.hasData ? snapshot.data!.timeWork.toString() : (GetIt.I.get<TimerRepo>().history.work / 60).round().toString();

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundedButton(
                                color: Colors.purple,
                                isPlus: false,
                                size: h * 0.08,
                                tap: () => GetIt.I.get<TimerRepo>().change(isIncrease: false, isWork: false, work: work, relax: relax),
                              ),
                              CustomText(text: relax),
                              RoundedButton(
                                color: Colors.purple,
                                isPlus: true,
                                size: h * 0.08,
                                tap: () => GetIt.I.get<TimerRepo>().change(isIncrease: true, isWork: false, work: work, relax: relax),
                              ),
                            ],
                          );
                        },
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
                  onTap: () => GetIt.I.get<TimerRepo>().setTimerForm(1),
                  text: AppLocalizations.current.m30m10,
                ),
                TimeButton(
                  onTap: () => GetIt.I.get<TimerRepo>().setTimerForm(2),
                  text: AppLocalizations.current.m20m5,
                ),
                TimeButton(
                  onTap: () => GetIt.I.get<TimerRepo>().setTimerForm(3),
                  text: AppLocalizations.current.m10m2,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StartOrStop(isStart: true, onTap: () => GetIt.I.get<TimerRepo>().startTimer()),
              StartOrStop(isStart: false, onTap: () => GetIt.I.get<TimerRepo>().stop()),
            ],
          ),
        ],
      ),
    );
  }
}
