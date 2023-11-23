// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/core/data/repo.dart';
import 'package:app_with_apps/core/models/class/part_time__class.dart';
import 'package:app_with_apps/core/models/class/task_class.dart';
import 'package:app_with_apps/core/models/enum/part_time__enum.dart';
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
  }

  AppRepo repo = AppRepo();

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
      // await service.deleteFolder(event.id);
      emit(DeleteSucess());
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addTask(
    AddTaskEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    repo.addTask(element: event.task);
    emit(BlocSuccess());
    // try {} catch (error) {
    //   emit(BlocError());
    // }
  }

  Future<void> _getTasks(
    GetTasksEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);
      emit(GetTasksSuccess(repo.getTasks()));
    } catch (error) {
      emit(BlocError());
    }
  }
}
