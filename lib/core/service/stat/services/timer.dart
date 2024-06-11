import 'package:app_with_apps/core/service/stat/repo.dart';
import 'package:timer/stat/history.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TimerStatService {
  String get relax => GetIt.I.get<TimerRepo>().relax;
  String get work => GetIt.I.get<TimerRepo>().work;
}
