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
  String id;
  @override
  List<Object?> get props => [id];
}

class AddTaskEvent extends TasksBlocEvent {
  AddTaskEvent({required this.task});
  TaskElement task;
  @override
  List<Object?> get props => [task];
}

class EditToDoEvent extends TasksBlocEvent {
  TaskElement element;
  EditToDoEvent({required this.element});
  @override
  List<Object?> get props => [element];
}

class WipeToDoEvent extends TasksBlocEvent {
  @override
  List<Object?> get props => [];
}
