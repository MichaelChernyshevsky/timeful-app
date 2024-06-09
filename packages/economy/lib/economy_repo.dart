import 'package:economy/stat/model/economy_stat.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/economy_class.dart';

class EconomyRepo {
  late Box<EconomyModel> boxEconomy;
  late Box<EconomyStat> boxEconomyStat;

  static const String _boxEconomy = 'boxEconomy';
  static const String _boxEconomyStat = 'boxEconomyStat';

  Future init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(EconomyModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(EconomyStatAdapter());
      await initializeStat();
    }

    boxEconomy = await Hive.openBox<EconomyModel>(_boxEconomy);
  }

  Future initializeStat() async {
    boxEconomyStat = await Hive.openBox<EconomyStat>(_boxEconomyStat);

    if (boxEconomyStat.values.toList().isEmpty) {
      boxEconomyStat.add(EconomyStat.empty());
    }
  }

  EconomyStat get stat => boxEconomyStat.values.first;

  Future changeStat({
    required int income,
    required int moneyAll,
  }) async {
    final statModel = boxEconomyStat.values.first.edit(income: income, moneyAll: moneyAll);
    boxEconomyStat.deleteAt(0);
    boxEconomyStat.add(statModel);
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxEconomy);
    await Hive.deleteBoxFromDisk(_boxEconomyStat);

    boxEconomy = await Hive.openBox<EconomyModel>(_boxEconomy);
    await initializeStat();
  }

  List<EconomyModel> get() => boxEconomy.values.toList().reversed.toList();

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
