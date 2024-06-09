import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:economy/economy.dart';

class EconomyStatService {
  int get income => GetIt.I.get<EconomyRepo>().stat.income;
  int get moneyAll => GetIt.I.get<EconomyRepo>().stat.moneyAll;
}
