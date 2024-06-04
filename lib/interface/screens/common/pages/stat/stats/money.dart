import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat/widgets.dart';

class MoneyStat extends StatelessWidget {
  const MoneyStat({
    super.key,
    required this.statProvider,
  });

  final StatProvider statProvider;

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
                AppLocalizations.current.money,
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
                        Icon(Icons.file_download, size: h * 0.04, color: UTILSConstants.pink),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text(AppLocalizations.current.income),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${statProvider.getIncome()}',
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
                        Icon(Icons.account_balance_wallet, size: h * 0.04, color: UTILSConstants.pink),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.02),
                          child: Text(AppLocalizations.current.wallet),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${statProvider.getWallet()}',
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
