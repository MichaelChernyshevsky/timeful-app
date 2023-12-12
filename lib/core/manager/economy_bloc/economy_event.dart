// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'economy_bloc.dart';

abstract class EconomyBlocEvent extends Equatable {}

class GetEconomyEvent extends EconomyBlocEvent {
  @override
  List<Object?> get props => [];
}

class WipeEconomyEvent extends EconomyBlocEvent {
  @override
  List<Object?> get props => [];
}

class DisposeEvent extends EconomyBlocEvent {
  @override
  List<Object?> get props => [];
}

class DeleteEconomyEvent extends EconomyBlocEvent {
  String id;
  DeleteEconomyEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class AddEconoomyEvent extends EconomyBlocEvent {
  EconomyElement element;
  AddEconoomyEvent({required this.element});
  @override
  List<Object?> get props => [element];
}

class EditEconomyEvent extends EconomyBlocEvent {
  EconomyElement element;
  EditEconomyEvent({required this.element});
  @override
  List<Object?> get props => [element];
}
