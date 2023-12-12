// ignore_for_file: avoid_dynamic_calls
import 'package:hive_flutter/hive_flutter.dart';

int getIndex({required String id, required Box box}) {
  for (var index = 0; index <= box.length; index += 1) {
    if (box.values.elementAt(index).id == id) {
      return index;
    }
  }
  return -1;
}
