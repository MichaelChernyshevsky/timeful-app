// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/core/data/repo.dart';
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'economy_event.dart';
part 'economy_state.dart';

class EconomyBloc extends Bloc<EconomyBlocEvent, EconomyBlocState> {
  EconomyBloc() : super(NotesInitial()) {
    on<DeleteSpendingEvent>(_deleteSpending);
    on<AddSpendingEvent>(_addSpending);
    on<GetSpendingsEvent>(_getSpending);
    on<DisposeEvent>(_dispose);
    on<EditSpendingEvent>(_edit);
  }

  AppRepo repo = AppRepo();

  // ServiceApiNotes service = ServiceApiNotes();

  Future<void> _dispose(
    DisposeEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    emit(EmptyEconomy());
  }

  Future<void> _edit(
    EditSpendingEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    emit(EmptyEconomy());
  }

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
    AddSpendingEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    repo.addHistory(element: event.element);
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
      emit(GetHistorySuccess(repo.getHistory()));
    } catch (error) {
      emit(BlocError());
    }
  }
}
