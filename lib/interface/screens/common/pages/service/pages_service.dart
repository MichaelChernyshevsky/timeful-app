import 'package:app_with_apps/interface/exports/screens_exports.dart';

class PagesService {
  static List<Widget> get pagesEconomy => [
        const NewsEconomyPage(),
        const HistoryEconomyPage(),
        const UserPage(),
      ];
  static List<Widget> get pagesTodo => [
        const NewsToDoPage(),
        const HistoryToDoPage(),
        const UserPage(),
      ];
}
