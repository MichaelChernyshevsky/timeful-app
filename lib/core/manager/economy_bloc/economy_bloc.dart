// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/interface/exports/screens_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'economy_event.dart';
part 'economy_state.dart';

class EconomyBloc extends Bloc<EconomyBlocEvent, EconomyBlocState> {
  EconomyBloc() : super(NotesInitial()) {
    on<DeleteEconomyEvent>(_deleteSpending);
    on<AddEconoomyEvent>(_addSpending);
    on<GetEconomyEvent>(_getSpending);
    on<DisposeEvent>(_dispose);
    on<EditEconomyEvent>(_edit);
    on<WipeEconomyEvent>(_wipeData);
    // on<GetStatEvent>(_getStat);
  }

  Future<void> _dispose(
    DisposeEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    emit(EmptyEconomy());
  }

  Future<void> _edit(
    EditEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    emit(EmptyEconomy());
  }

  Future<void> _deleteSpending(
    DeleteEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      final isDeleted = await GetIt.I.get<EconomyRepo>().delete(id: event.id);
      emit(Delete(isDeleted));
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addSpending(
    AddEconoomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    await GetIt.I.get<EconomyRepo>().add(element: event.element);

    if (event.element.isSpending) {
      await GetIt.I.get<EconomyRepo>().changeStat(
            income: 0,
            moneyAll: -event.element.count,
          );
    } else {
      await GetIt.I.get<EconomyRepo>().changeStat(
            income: event.element.count,
            moneyAll: event.element.count,
          );
    }

    emit(BlocSuccess());
  }

  Future<void> _getSpending(
    GetEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      emit(GetHistorySuccess(GetIt.I.get<EconomyRepo>().get()));
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _wipeData(
    WipeEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      await GetIt.I.get<EconomyRepo>().wipe();
      emit(BlocSuccess());
    } catch (error) {
      emit(BlocError());
    }
  }

  // Future<void> _getStat(
  //   GetStatEvent event,
  //   Emitter<EconomyBlocState> state,
  // ) async {
  //   emit(Loading());

  //   emit(Stat());
  // }
}
