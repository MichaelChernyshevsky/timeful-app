class TimerModel {
  final String id;
  final String userId;
  final History history;
  final Stat stat;

  TimerModel({
    required this.id,
    required this.userId,
    required this.history,
    required this.stat,
  });

  factory TimerModel.fromJson({required Map<String, dynamic> json}) {
    return TimerModel(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      history: History(
        work: json['history']['work'],
        relax: json['history']['relax'],
      ),
      stat: Stat(
        timeWork: json['stat']['timeWork'],
        timeStat: json['stat']['timeStat'],
      ),
    );
  }
}

class History {
  final int work;
  final int relax;
  int workSave = 0;
  int relaxSave = 0;

  History({required this.work, required this.relax});
}

class Stat {
  final int timeWork;
  final int timeStat;
  int timeWorkSave = 0;
  int timeStatSave = 0;

  Stat({required this.timeWork, required this.timeStat});
}
