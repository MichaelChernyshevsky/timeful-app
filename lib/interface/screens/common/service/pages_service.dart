import 'package:app_with_apps/interface/exports/screens_exports.dart';

class PagesService {
  static List<Widget> get pages => [
        const NewsPage(),
        const NewsPage(),
        const ToDoPage(),
        const HistoryEconomyPage(),
        const UserPage(),
      ];
}
