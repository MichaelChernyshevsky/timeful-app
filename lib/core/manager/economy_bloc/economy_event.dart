// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'economy_bloc.dart';

abstract class EconomyBlocEvent extends Equatable {}

class GetSpendingsEvent extends EconomyBlocEvent {
  @override
  List<Object?> get props => [];
}

class DisposeEvent extends EconomyBlocEvent {
  @override
  List<Object?> get props => [];
}

class DeleteSpendingEvent extends EconomyBlocEvent {
  int id;
  DeleteSpendingEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class AddSpendingEvent extends EconomyBlocEvent {
  EconomyElement element;
  AddSpendingEvent({required this.element});
  @override
  List<Object?> get props => [element];
}

class EditSpendingEvent extends EconomyBlocEvent {
  EconomyElement element;
  EditSpendingEvent({required this.element});
  @override
  List<Object?> get props => [element];
}
