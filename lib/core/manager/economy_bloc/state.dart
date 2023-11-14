// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'economy_bloc.dart';

abstract class EconomyBlocState extends Equatable {}

class NotesInitial extends EconomyBlocState {
  @override
  List<Object?> get props => [];
}

class DeleteSucess extends EconomyBlocState {
  DeleteSucess();
  @override
  List<Object?> get props => [];
}

class GetHistorySuccess extends EconomyBlocState {
  GetHistorySuccess(this.elements);

  final List<HistoryElement> elements;
  @override
  List<Object?> get props => [elements];
}

class BlocError extends EconomyBlocState {
  @override
  List<Object?> get props => [];
}

class BlocSuccess extends EconomyBlocState {
  @override
  List<Object?> get props => [];
}
