import 'package:hive/hive.dart';

part 'economy_stat.g.dart';

@HiveType(typeId: 1)
class EconomyStat {
  @HiveField(0)
  int income;
  @HiveField(1)
  int moneyAll;

  EconomyStat({
    required this.income,
    required this.moneyAll,
  });

  EconomyStat edit({required int income, required int moneyAll}) {
    return EconomyStat(income: this.income + income, moneyAll: this.moneyAll + moneyAll);
  }

  factory EconomyStat.empty() => EconomyStat(income: 0, moneyAll: 0);
}
