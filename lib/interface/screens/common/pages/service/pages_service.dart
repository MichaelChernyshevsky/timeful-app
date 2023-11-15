import 'package:app_with_apps/interface/exports/screens_exports.dart';

class PagesService {
  static List<Widget> get pages => [
        const NewsEconomyPage(),
        const NewsEconomyPage(),
        const HistoryToDoPage(),
        const HistoryEconomyPage(),
        const UserPage(),
      ];
}
