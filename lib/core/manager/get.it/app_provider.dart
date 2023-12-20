import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppProvider extends ChangeNotifier {
  bool loggined = true;

  List<Color> colorsList = [
    Colors.white,
    Colors.black,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  List<SortParametrs> sortParametrs = [
    SortParametrs(
      icon: const Icon(Icons.arrow_back_ios_new),
      title: AppLocalizations.current.sortAll,
    ),
    SortParametrs(
      icon: const Icon(Icons.arrow_back_ios_new),
      title: AppLocalizations.current.sortByDate,
    ),
    SortParametrs(
      icon: const Icon(Icons.arrow_back_ios_new),
      title: AppLocalizations.current.sortMin,
    ),
    SortParametrs(
      icon: const Icon(Icons.arrow_back_ios_new),
      title: AppLocalizations.current.sortMax,
    ),
  ];

  List<Widget> get pages => PagesService.pages;
}
