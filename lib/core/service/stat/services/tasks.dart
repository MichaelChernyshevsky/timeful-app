import 'package:app_with_apps/interface/exports/screens_exports.dart';

class TasksStatService {
  int get done => GetIt.I.get<TaskRepo>().stat.done;
  int get undone => GetIt.I.get<TaskRepo>().stat.undone;
  void changeStateElement(String id) => GetIt.I.get<TaskRepo>().changeDoneState(id);
}
