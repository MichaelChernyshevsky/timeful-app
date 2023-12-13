import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';

class NavigationConstants {
  static List<IconData> get iconsBottomBar => [
        Icons.home_rounded,
        Icons.home_rounded,
        Icons.timelapse,
        Icons.favorite_rounded,
        Icons.favorite_rounded,
        Icons.person_rounded,
      ];
  static List<String> get titlesBottomBar => [
        AppLocalizations.current.news,
        AppLocalizations.current.news,
        AppLocalizations.current.timer,
        AppLocalizations.current.historyEconomy,
        AppLocalizations.current.historyEconomy,
        AppLocalizations.current.user,
      ];
}
