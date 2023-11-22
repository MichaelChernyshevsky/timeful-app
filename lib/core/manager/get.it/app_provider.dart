import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
import 'package:app_with_apps/core/models/enum/todo_sort_state.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppProvider extends ChangeNotifier {
  // app
  bool loggined = true;

  // history

  List<int> sortsIndex = [0, 0];

  List<Enum> pagesStates = [
    EconomySortState.all,
    ToDoSortState.all,
  ];

  List<Color> colorsList = [
    Colors.white,
    Colors.black,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  List<PartTime> partTime = [
    PartTime(
      index: 3,
      partTime: PartTimeEnum.anyway,
    ),
    PartTime(
      index: 0,
      partTime: PartTimeEnum.morning,
    ),
    PartTime(
      index: 1,
      partTime: PartTimeEnum.day,
    ),
    PartTime(
      index: 3,
      partTime: PartTimeEnum.evening,
    ),
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

  List<List<int>> kindsSorts = [
    [
      1,
      2,
      3,
    ],
    [
      4,
      5,
      6,
    ],
  ];

  List<Widget> get pages => PagesService.pages;
}
