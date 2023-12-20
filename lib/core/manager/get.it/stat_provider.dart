import 'package:app_with_apps/interface/exports/screens_exports.dart';

class StatProvider extends ChangeNotifier {
  static int moneyAll = 0;
  static int moneyYear = 0;
  static int moneyMounth = 0;

  void initStat() {
    moneyAll = 100;
  }

  int getMoneyAll() => moneyAll;

  int getMoneyYear() => moneyYear;

  int getMoneyMounthl() => moneyMounth;

  void increaseMoneyYear({required int mon}) => moneyYear += mon;

  void decreaseMoneyYear({required int mon}) => moneyYear -= mon;

  void increaseMoneyMounth({required int mon}) {
    moneyMounth += mon;
    moneyAll += mon;
  }

  void decreaseMoneyMounth({required int mon}) {
    moneyYear -= mon;
    moneyAll -= mon;
  }
}
