// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class EconomyBloc extends Bloc<EconomyBlocEvent, EconomyBlocState> {
  EconomyBloc() : super(NotesInitial()) {
    on<DeleteSpendingEvent>(_deleteSpending);
    on<AddSpending>(_addSpending);
    on<GetSpendingsEvent>(_getSpending);
  }

  List<HistoryElement> history = [
    HistoryElement(title: 'title', count: 1),
    HistoryElement(title: 'title', count: 1),
    HistoryElement(title: 'title', count: 1),
    HistoryElement(title: 'title', count: 1),
    HistoryElement(title: 'title', count: 1),
  ];

  // ServiceApiNotes service = ServiceApiNotes();

  Future<void> _deleteSpending(
    DeleteSpendingEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);
      emit(DeleteSucess());
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addSpending(
    AddSpending event,
    Emitter<EconomyBlocState> state,
  ) async {
    history.add(event.element);
    emit(BlocSuccess());
    // try {} catch (error) {
    //   emit(BlocError());
    // }
  }

  Future<void> _getSpending(
    GetSpendingsEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);
      emit(GetHistorySuccess(history));
    } catch (error) {
      emit(BlocError());
    }
  }
}
