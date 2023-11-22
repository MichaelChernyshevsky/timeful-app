// ignore_for_file: invalid_use_of_visible_for_testing_member
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
  // ServiceApiNotes service = ServiceApiNotes();

  Future<void> _dispose(
    DisposeEvent event,
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
    tasks.add(event.task);
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
      emit(GetTasksSuccess(tasks));
    } catch (error) {
      emit(BlocError());
    }
  }
}
