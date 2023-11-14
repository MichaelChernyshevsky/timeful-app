import 'package:app_with_apps/core/exports/exports.dart';
import 'package:app_with_apps/core/localization/app_localization.dart';

class AppConstants {
  static List<IconData> get iconsBottomBar => [
        Icons.home_rounded,
        Icons.favorite_rounded,
        Icons.person_rounded,
      ];
  static List<String> get titlesBottomBar => [
        AppLocalizations.current.news,
        AppLocalizations.current.history,
        AppLocalizations.current.user,
      ];
}
