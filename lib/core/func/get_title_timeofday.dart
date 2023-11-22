import 'package:app_with_apps/core/localization/app_localization.dart';

String getTitleTimeOfDay({required int index}) {
  if (index == 0) {
    return AppLocalizations.current.morning;
  } else if (index == 1) {
    return AppLocalizations.current.day;
  } else if (index == 2) {
    return AppLocalizations.current.anyway;
  } else {
    return AppLocalizations.current.anyway;
  }
}
