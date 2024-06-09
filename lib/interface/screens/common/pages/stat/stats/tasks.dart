import 'package:app_with_apps/service/stat/stat.dart';
import 'package:app_with_apps/interface/utils/constants/constants_uikit.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/widgets.dart';

class TasksStat extends StatelessWidget {
  const TasksStat({
    super.key,
    required this.statProvider,
  });

  final StatService statProvider;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.current.tasks,
                style: TextStyle(fontSize: h * 0.03),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: h * 0.03,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: h * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatForm(
                  widgets: [
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            size: h * 0.06,
                            color: UTILSConstants.done,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.03),
                            child: Text(
                              '${statProvider.getTask(isDone: true)} tasks done',
                              style: TextStyle(fontSize: h * 0.036),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  w: w * 0.81,
                  h: h * 0.15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
