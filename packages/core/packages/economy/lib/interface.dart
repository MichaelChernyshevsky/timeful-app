import 'package:economy/model.dart';

abstract class EconomyInterface {
  void add({
    required String title,
    required String description,
    required int count,
    required int date,
    required int income,
    required String userId,
  }) {}
  void delete({required String id}) {}
  void get({required String userId}) {}
  void stat() {}
}
