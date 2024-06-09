import 'package:app_with_apps/core/models/class/sort_parametrs_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppProvider extends ChangeNotifier {
  bool loggined = true;

  List<Widget> get pages => PagesService.pages;
}
