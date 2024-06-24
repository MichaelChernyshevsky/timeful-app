// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:economy/economy.dart';
import 'package:economy/interface.dart';
import 'package:economy/uri.dart';
import 'package:helpers/helpers.dart';
export 'dart:io';
export 'package:path_provider/path_provider.dart';

class EconomyRepository extends Repository implements EconomyInterface {
  EconomyRepository({required super.httpService});
  late Isar isar;

  Future<void> initialize({required bool internet, required bool loggined, required String userId, required String location}) async {
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open(
      [EconomyModelSchema],
      directory: location,
    );
    if (internet && loggined) await refresh(userId: userId);
  }

  Future<void> close() async => await isar.close();

  @override
  Future<bool> addEconomyApi({
    required String title,
    required String description,
    required int count,
    required int date,
    required int income,
    required String userId,
  }) async {
    final BaseResponse resp = await httpService.post(economyAdd, data: {
      "userId": userId,
      "count": count,
      "date": date,
      "income": income == true ? 1 : false,
      "title": title,
      "description": description,
    });
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<bool> deleteEconomyApi({required String id}) async {
    final BaseResponse resp = await httpService.delete(economyDelete, data: {"id": id});
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<List<EconomyModel>> getEconomyApi({required String userId}) async {
    final BaseResponse resp = await httpService.post(economyGet, data: {"userId": userId});
    final List<EconomyModel> models = [];
    for (final element in resp.data['data']) {
      models.add(EconomyModel.fromJson(element));
    }
    return models;
  }

  Future<void> refresh({required String userId}) async {
    final list = await isar.economyModels.filter().inDBlEqualTo(false).findAll();
    if (list.isNotEmpty) {
      for (final EconomyModel element in list) {
        await addEconomy(
          count: int.parse(element.count),
          title: element.title,
          description: element.description ?? '',
          date: element.date,
          income: element.income,
          userId: userId,
          loggined: true,
          internet: true,
        );
      }
      await isar.writeTxn(() async {
        await isar.economyModels.filter().inDBlEqualTo(false).deleteAll();
      });
    }

    final elements = await getEconomyApi(userId: userId);
    await isar.writeTxn(() async {
      for (final element in elements) {
        final contain = await isar.economyModels.filter().idEqualTo(element.id).findAll();
        if (contain.isEmpty) {
          await isar.economyModels.put(element);
        }
      }
    });
  }

  @override
  void statEconomyApi() {}

  Future<bool> addEconomy({
    required String title,
    required String description,
    required int count,
    required int date,
    required bool income,
    required String userId,
    required bool loggined,
    required bool internet,
  }) async {
    // try {
    if (internet && loggined) {
      final state = await addEconomyApi(
        count: count,
        title: title,
        description: description,
        date: date,
        income: income == true ? 1 : 0,
        userId: userId,
      );
      return state;
    } else {
      await isar.writeTxn(() async {
        final newEconomy = EconomyModel(
          id: Random().nextInt(1000000000),
          title: title,
          count: count.toString(),
          income: true,
          description: "This is an example",
          date: DateTime.now().millisecondsSinceEpoch,
          userId: userId,
          inDBl: false,
        );

        await isar.economyModels.put(newEconomy);
      });

      return true;
    }
    // } catch (_) {
    //   return false;
    // }
  }

  Future<bool> deleteEconomy({required int id, required bool loggined, required bool internet}) async {
    try {
      late bool stat;
      if (internet && loggined) {
        stat = await deleteEconomyApi(id: id.toString());
      } else {
        stat = true;
      }
      await isar.writeTxn(() async {
        await isar.economyModels.delete(id);
      });
      return stat;
    } catch (_) {
      return false;
    }
  }

  Future<List<EconomyModel>> getEconomy({required String userId, required bool loggined, required bool internet}) async {
    if (internet && loggined) {
      await refresh(userId: userId);
    }
    return await isar.economyModels.where().findAll();
  }
}
