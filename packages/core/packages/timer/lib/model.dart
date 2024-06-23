class TimerModel1 {
  final String id;
  final String userId;
  final History1 history;
  final Stat1 stat;

  TimerModel1({
    required this.id,
    required this.userId,
    required this.history,
    required this.stat,
  });

  factory TimerModel1.fromJson({required Map<String, dynamic> json}) {
    return TimerModel1(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      history: History1(
        work: json['history']['work'],
        relax: json['history']['relax'],
      ),
      stat: Stat1(
        timeWork: json['stat']['timeWork'],
        timeStat: json['stat']['timeStat'],
      ),
    );
  }
}

class History1 {
  final int work;
  final int relax;

  History1({required this.work, required this.relax});
}

class Stat1 {
  final int timeWork;
  final int timeStat;

  Stat1({required this.timeWork, required this.timeStat});
}
