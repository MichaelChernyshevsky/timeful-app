// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/core/data/hive/service_hive.dart';
import 'package:app_with_apps/core/manager/get.it/stat_provider.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksBlocEvent, TasksBlocState> {
  TasksBloc() : super(TasksInitial()) {
    on<DeleteTaskEvent>(_deleteTask);
    on<AddTaskEvent>(_addTask);
    on<GetTasksEvent>(_getTasks);
    on<DisposeEvent>(_dispose);
    on<EditToDoEvent>(_edit);
    on<WipeToDoEvent>(_wipeData);
  }

  ServiceHive repo = ServiceHive();

  List<TaskElement> tasks = [];

  // ServiceApiNotes service = ServiceApiNotes();

  Future<void> _dispose(
    DisposeEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    emit(EmptyTasks());
  }

  Future<void> _edit(
    EditToDoEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    emit(EmptyTasks());
  }

  Future<void> _deleteTask(
    DeleteTaskEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    try {
      final isDeleted = repo.deleteTask(id: event.id);
      emit(Delete(isDeleted));
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addTask(
    AddTaskEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    await repo.addTask(element: event.task);

    emit(BlocSuccess());

    // await _repo.add(task: event.task);
    // try {} catch (error) {
    //   emit(BlocError());
    // }
  }

  Future<void> _getTasks(
    GetTasksEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    final tasks = await repo.getTasks();
    final listId = GetIt.I.get<StatProvider>().getTasksDone();
    for (var i = 0; i <= tasks.length - 1; i++) {
      for (final id in listId) {
        if (tasks[i].id == id) {
          tasks[i].isDone = true;
        }
      }
    }
    emit(GetTasksSuccess(tasks));
  }

  Future<void> _wipeData(
    WipeToDoEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    try {
      await repo.wipeTasks();
      emit(BlocSuccess());
    } catch (error) {
      emit(BlocError());
    }
  }
}
