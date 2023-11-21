// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksBlocEvent extends Equatable {}

class GetTasksEvent extends TasksBlocEvent {
  @override
  List<Object?> get props => [];
}

class DisposeEvent extends TasksBlocEvent {
  @override
  List<Object?> get props => [];
}

class DeleteTaskEvent extends TasksBlocEvent {
  DeleteTaskEvent({required this.id});
  int id;
  @override
  List<Object?> get props => [id];
}

class AddTaskEvent extends TasksBlocEvent {
  AddTaskEvent({required this.task});
  Task task;
  @override
  List<Object?> get props => [task];
}
