import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:app_with_apps/interface/screens/common/pages/stat_page.dart';
import 'package:app_with_apps/interface/screens/common/pages/timer_page.dart';

class PagesService {
  static List<Widget> get pages => [
        const StatPage(),
        const NewsPage(),
        const TimerPage(),
        const TaskPage(),
        const EconomyPage(),
        const UserPage(),
      ];
}
