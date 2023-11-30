import 'package:app_with_apps/core/localization/app_localization.dart';
import 'package:app_with_apps/core/models/class/economy_class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EconomyRepo {
  late Box<EconomyElement> box;

  Future init() async {
    Hive.registerAdapter(TaskAdapter());
    box = await Hive.openBox<EconomyElement>(
      AppLocalizations.current.economyRepo,
    );
  }

  List<EconomyElement> getMoneys({DateTime? dateFilter}) {
    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }

    return box.values.toList();
  }

  Future<bool> addMoney(EconomyElement money) async {
    return (await box.add(money)) != -1;
  }

  Future<bool> removeMoney(TaskElement money) => money.delete().then((_) {
        return true;
      }).catchError((_) {
        return false;
      });

  Future wipeData() async {
    await Hive.deleteFromDisk();
    box = await Hive.openBox<EconomyElement>(
      AppLocalizations.current.economyRepo,
    );
  }
}
