import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/widget/widgets_stat.dart';
import 'package:app_with_apps/interface/screens/widgets/body.dart';
import 'package:app_with_apps/interface/screens/widgets/text.dart';
import 'package:flutter/material.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  final statProvider = GetIt.I.get<StatProvider>();

  @override
  Widget build(BuildContext context) {
    return Body(
      widget: Column(
        children: [
          // TitleStat(
          //   text: AppLocalizations.current.dayStat,
          // ),
          // TitleStat(
          //   text: AppLocalizations.current.weekStat,
          // ),
          // TitleStat(
          //   text: AppLocalizations.current.mounthStat,
          // ),
          TitleStat(
            text: AppLocalizations.current.allStat,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CustomText(
                    text: AppLocalizations.current.income,
                  ),
                  CustomText(
                    text: AppLocalizations.current.allMoney,
                  ),
                  CustomText(
                    text: AppLocalizations.current.minutesInWork,
                  ),
                  CustomText(
                    text: AppLocalizations.current.minutesInRelax,
                  ),
                  CustomText(
                    text: AppLocalizations.current.taskDone,
                  ),
                  CustomText(
                    text: AppLocalizations.current.taskUnDone,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomText(
                    text: statProvider.getIncome().toString(),
                  ),
                  CustomText(
                    text: statProvider.getSpending().toString(),
                  ),
                  CustomText(
                    text: statProvider.getMinutesInWork().toString(),
                  ),
                  CustomText(
                    text: statProvider.getMinuteInRelax().toString(),
                  ),
                  CustomText(
                    text: statProvider.getTask(isDone: true).toString(),
                  ),
                  CustomText(
                    text: statProvider.getTask(isDone: false).toString(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
