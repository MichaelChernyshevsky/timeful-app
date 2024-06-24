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
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Body(
      widget: Column(
        children: [
          PageTitle(h: h, text: AppLocalizations.current.statistics),
          MoneyStat(),
          TimeStat(),
          TasksStat(),
        ],
      ),
    );
  }
}
