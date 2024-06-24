// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/core/models.dart';
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
      final isDeleted = await GetIt.I.get<CoreService>().deleteTasks(id: event.id);
      emit(Delete(isDeleted));
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addTask(
    AddTaskEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    emit(BlocSuccess());

    // await _repo.add(task: event.task);
    try {
      final state = await GetIt.I.get<CoreService>().addTasks(element: event.task);
      state ? emit(BlocSuccess()) : emit(BlocError());
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _getTasks(
    GetTasksEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    emit(GetTasksSuccess(await GetIt.I.get<CoreService>().getTasks()));
  }

  Future<void> _wipeData(
    WipeToDoEvent event,
    Emitter<TasksBlocState> state,
  ) async {
    try {
      await GetIt.I.get<CoreService>().tasksWipe();
      emit(BlocSuccess());
    } catch (error) {
      emit(BlocError());
    }
  }
}
