import 'package:app_with_apps/core/models/class/economy_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EconomyRepo {
  List<EconomyElement> get({required Box<EconomyElement> box, filter}) {
    // List<EconomyElement> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }
    if (filter != null) {}
    return box.values.toList();
  }

  Future<bool> add({
    required Box<EconomyElement> box,
    required EconomyElement element,
  }) async {
    return (await box.add(element)) != -1;
  }

  Future edit({
    required Box<EconomyElement> box,
    required EconomyElement element,
    required int index,
  }) async {}

  Future<bool> removeMoney({
    required Box<EconomyElement> box,
    required int id,
  }) async {
    return true;
  }
}
