import 'package:shared_preferences/shared_preferences.dart';

class RepoString {
  Future<String> getData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) == null ? '' : prefs.getString(key)!;
  }

  Future saveData({
    required String key,
    required String data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }
}

class RepoInt {
  Future<int> getData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) == null ? 0 : prefs.getInt(key)!;
  }

  Future saveData({
    required String key,
    required int data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, data);
  }
}

class RepoKeys {
  static const String moneyAll = 'moneyAll';
  // static const String moneyYear = 'moneyYear';
  // static const String moneyMounth = 'moneyMounth';
  static const String income = 'income';
  static const String minutesInWork = 'minutesInWork';
  static const String minutesInRelax = 'minutesInRelax';
  static const String doneTasks = 'doneTasks';
  static const String doneTask = 'doneTask';
  static const String undoneTask = 'undoneTask';
}
