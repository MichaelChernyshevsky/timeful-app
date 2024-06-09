import 'package:hive_flutter/hive_flutter.dart';

import 'models/economy_class.dart';

class EconomyRepo {
  late Box<EconomyModel> boxEconomy;

  static const String _boxEconomy = 'boxEconomy';

  Future init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(EconomyModelAdapter());

      boxEconomy = await Hive.openBox<EconomyModel>(_boxEconomy);
    }
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxEconomy);
    boxEconomy = await Hive.openBox<EconomyModel>(_boxEconomy);
  }

  List<EconomyModel> get() {
    // List<EconomyModel> get({DateTime? dateFilter}) {

    // if (dateFilter != null) {
    //   return moneyBox.values
    //       .where((money) => money.wastedDate.month == dateFilter.month)
    //       .toList();
    // }
    return boxEconomy.values.toList();
  }

  Future<bool> add({
    required EconomyModel element,
  }) async {
    return (await boxEconomy.add(element)) != -1;
  }

  Future edit({
    required EconomyModel element,
    // required int index,
  }) async {}

  Future<bool> delete({
    required String id,
  }) async {
    final indexElement = getIndex(id: id, box: boxEconomy);
    await boxEconomy.deleteAt(indexElement);
    return true;
  }

  int getIndex({required String id, required Box box}) {
    for (var index = 0; index <= box.length; index += 1) {
      if (box.values.elementAt(index).id == id) {
        return index;
      }
    }
    return -1;
  }
}
