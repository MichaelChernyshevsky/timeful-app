import 'package:app_with_apps/core/service/stat/stat.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/widgets.dart';

class TimeStat extends StatelessWidget {
  const TimeStat({
    super.key,
    required this.statProvider,
  });

  final StatService statProvider;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.current.time,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work, size: h * 0.04, color: UTILSConstants.purple),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text(AppLocalizations.current.work),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          statProvider.timer.work,
                          style: TextStyle(fontSize: h * 0.03),
                        ),
                      ],
                    ),
                  ],
                  w: w * 0.38,
                  h: h * 0.15,
                ),
                StatForm(
                  widgets: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.energy_savings_leaf, size: h * 0.04, color: UTILSConstants.purple),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text(AppLocalizations.current.relax),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          statProvider.timer.relax,
                          style: TextStyle(fontSize: h * 0.03),
                        ),
                      ],
                    ),
                  ],
                  w: w * 0.38,
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
