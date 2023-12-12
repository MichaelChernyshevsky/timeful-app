part of 'tasks_bloc.dart';

abstract class TasksBlocState extends Equatable {}

class TasksInitial extends TasksBlocState {
  @override
  List<Object?> get props => [];
}

class EmptyTasks extends TasksBlocState {
  @override
  List<Object?> get props => [];
}

class Delete extends TasksBlocState {
  Delete(
    this.isDeleted,
  );
  final isDeleted;
  @override
  List<Object?> get props => [isDeleted];
}

class GetTasksSuccess extends TasksBlocState {
  GetTasksSuccess(this.tasks);

  final List<TaskElement> tasks;
  @override
  List<Object?> get props => [tasks];
}

class BlocError extends TasksBlocState {
  @override
  List<Object?> get props => [];
}

class BlocSuccess extends TasksBlocState {
  @override
  List<Object?> get props => [];
}
