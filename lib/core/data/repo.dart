import 'package:app_with_apps/core/models/class/history_class.dart';
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';

class AppRepo {
  List<HistoryElement> history = [
    HistoryElement(
      id: 1,
      title: 'title',
      count: 1,
      isSpending: true,
      description: '',
      date: null,
    ),
    HistoryElement(
      id: 3,
      title: 'title',
      count: 1,
      isSpending: true,
      description: '',
      date: null,
    ),
    HistoryElement(
      id: 4,
      title: 'title',
      count: 1,
      isSpending: false,
      description: '',
      date: null,
    ),
    HistoryElement(
      id: 6,
      title: 'title',
      count: 1,
      isSpending: false,
      description: '',
      date: null,
    ),
    HistoryElement(
      id: 8,
      title: 'title',
      count: 1,
      isSpending: false,
      description: '',
      date: null,
    ),
  ];

  List<HistoryElement> getHistory() => history;

  void addHistory({required HistoryElement element}) => history.add(element);

  void editHistory({required HistoryElement element}) {
    for (final el in history) {
      if (el.id == element.id) {
        final index = history.indexOf(el);
        history[index] = element;
      }
    }
  }

  List<TaskElement> tasks = [
    TaskElement(
      color: Colors.amber,
      id: 1,
      title: 'wqeqeqw',
      icon: const Icon(Icons.ac_unit),
      countOnDay: 1,
      count: 1,
      timeOfDay: PartTime(index: 0, partTime: PartTimeEnum.morning),
    ),
    TaskElement(
      color: Colors.red,
      id: 1,
      title: 'wqeqeqw',
      icon: const Icon(Icons.ac_unit),
      countOnDay: 1,
      count: 1,
      timeOfDay: PartTime(index: 1, partTime: PartTimeEnum.day),
    ),
    TaskElement(
      color: Colors.blue,
      id: 1,
      title: 'wqeqeqw',
      icon: const Icon(Icons.ac_unit),
      countOnDay: 1,
      count: 1,
      timeOfDay: PartTime(index: 2, partTime: PartTimeEnum.evening),
    ),
    TaskElement(
      color: Colors.pink,
      id: 1,
      title: 'wqeqeqw',
      icon: const Icon(Icons.ac_unit),
      countOnDay: 1,
      count: 1,
      timeOfDay: PartTime(index: 3, partTime: PartTimeEnum.anyway),
    ),
  ];

  List<TaskElement> getTasks() => tasks;

  void addTask({required TaskElement element}) => tasks.add(element);

  void editTasks({required TaskElement element}) {
    for (final el in tasks) {
      if (el.id == element.id) {
        final index = tasks.indexOf(el);
        tasks[index] = element;
      }
    }
  }
}
