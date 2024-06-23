abstract class TimerInterface {
  void get({required String userId}) {}

  void editHistory({
    required String userId,
    required String work,
    required String relax,
  }) {}

  void editStat({
    required String userId,
    required String timeWork,
    required String timeRelax,
  }) {}
}
