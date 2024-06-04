import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/stats/money.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/stats/tasks.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/stats/time.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  final statProvider = GetIt.I.get<StatProvider>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.statistics),
          MoneyStat(statProvider: statProvider),
          TimeStat(statProvider: statProvider),
          TasksStat(statProvider: statProvider),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       children: [
          //         CustomText(
          //           text: AppLocalizations.current.income,
          //         ),
          //         CustomText(
          //           text: AppLocalizations.current.money,
          //         ),
          //         CustomText(
          //           text: AppLocalizations.current.minutesInWork,
          //         ),
          //         CustomText(
          //           text: AppLocalizations.current.minutesInRelax,
          //         ),
          //         CustomText(
          //           text: AppLocalizations.current.taskDone,
          //         ),
          //         // CustomText(
          //         //   text: AppLocalizations.current.taskUnDone,
          //         // ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         CustomText(
          //           text: statProvider.getIncome().toString(),
          //         ),
          //         CustomText(
          //           text: statProvider.getSpending().toString(),
          //         ),
          //         CustomText(
          //           text: statProvider.getMinutesInWork().toString(),
          //         ),
          //         CustomText(
          //           text: statProvider.getMinuteInRelax().toString(),
          //         ),
          //         CustomText(
          //           text: statProvider.getTask(isDone: true).toString(),
          //         ),
          //         // CustomText(
          //         //   text: statProvider.getTask(isDone: false).toString(),
          //         // ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
