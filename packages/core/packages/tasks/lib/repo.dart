import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/interface.dart';
import 'package:tasks/model.dart';
import 'package:tasks/tasks.dart';
import 'package:helpers/helpers.dart';
import 'package:tasks/uri.dart';

class TaskRepository extends Repository implements TaskInterface {
  TaskRepository({required super.httpService});

  late Box<TaskModel> boxTasks;
  // late Box<TaskStat> boxTasksStat;

  static const String _boxTasks = 'boxTasks';
  // static const String _boxTasksStat = 'boxTasksStat';

  Future init() async {
    // Hive.registerAdapter(TaskStatAdapter());
    // await initializeStat();

    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
  }

  // Future initializeStat() async {
  //   boxTasksStat = await Hive.openBox<TaskStat>(_boxTasksStat);

  //   if (boxTasksStat.values.toList().isEmpty) {
  //     boxTasksStat.add(TaskStat.empty(date));
  //   }
  // }

  void refresh({required String userId}) {}

  List<TaskModel> get() {
    return boxTasks.values.toList();
  }

  Future<bool> add({
    required TaskModel task,
  }) async {
    return (await boxTasks.add(task)) != -1;
  }

  Future edit({
    required TaskModel element,
    // required int index,
  }) async {
    // final elementIndex = task.id;
  }

  Future<bool> delete({
    required String id,
  }) async {
    int getIndex({required String id, required Box box}) {
      for (var index = 0; index <= box.length; index += 1) {
        if (box.values.elementAt(index).id == id) {
          return index;
        }
      }
      return -1;
    }

    final indexElement = getIndex(id: id, box: boxTasks);
    await boxTasks.deleteAt(indexElement);
    return true;
  }

  @override
  Future<bool> addTasksApi({
    required String userId,
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) async {
    final BaseResponse resp = await httpService.post(addUri, data: {
      "userId": userId,
      "title": title,
      "description": description,
      "date": date,
      "countOnDay": int.parse(countOnDay),
      "countOnTask": int.parse(countOnTask),
    });
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<bool> deleteTasksApi({required String taskId}) async {
    final BaseResponse resp = await httpService.delete(deleteUri, data: {"taskId": taskId});
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<bool> editTasksApi({
    required String taskId,
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) async {
    final BaseResponse resp = await httpService.patch(editUri, data: {
      "taskId": taskId,
      "title": title,
      "description": description,
      "date": date,
      "countOnDay": countOnDay,
      "countOnTask": countOnTask,
    });
    return resp.message == MESSAGE_SUCCESS;
  }

  @override
  Future<TasksModels> getTasksApi({required String userId}) async {
    final BaseResponse resp = await httpService.post(getUri, data: {"userId": userId});
    return TasksModels.fromJson(resp.data);
  }

  @override
  Future<bool> statEditTasksApi({required String userId, required String countDone, required String countUnDone}) async {
    final BaseResponse resp = await httpService.patch(editStatUri, data: {
      "userId": userId,
      "countDone": countDone,
      "countUnDone": countUnDone,
    });
    return resp.message == MESSAGE_SUCCESS;
  }
}
