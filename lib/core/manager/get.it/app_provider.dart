import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/core/models/enum/todo_sort_state.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppProvider extends ChangeNotifier {
  // app
  bool loggined = true;

  // history

  Functions appIs = Functions.economy;

  int get sortIndex => sortsIndex[appIs.index];

  List<int> sortsIndex = [0, 0];

  List<Enum> pagesStates = [
    EconomySortState.all,
    ToDoSortState.all,
  ];

  void setSortIndex({required int index}) => sortsIndex[appIs.index] = index;

  String get getStateString => kindsSorts[appIs.index][sortIndex].toString();

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

  Enum get getState => getCurrentState();

  Enum getCurrentState() {
    if (appIs == Functions.economy) {
      return pagesStates[0];
    } else {
      return pagesStates[1];
    }
  }

  List<Widget> get pages => getPages();

  List<Widget> getPages() {
    if (appIs == Functions.economy) {
      return PagesService.pages_economy;
    }
    return PagesService.pages_todo;
  }

  Text get getAppBarTitle => Text(getTitle());

  String getTitle() {
    if (appIs == Functions.economy) {
      return AppLocalizations.current.economy;
    }
    return AppLocalizations.current.todo;
  }

  void changeFunctions() {
    if (appIs == Functions.todo) {
      appIs = Functions.economy;
    } else {
      appIs = Functions.todo;
    }
  }

  //
}
