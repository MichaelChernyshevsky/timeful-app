// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:app_with_apps/core/data/hive/economy_repo.dart';
import 'package:app_with_apps/core/data/hive/service_hive.dart';
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
  }

  ServiceHive service = ServiceHive();

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
      // await service.deleteFolder(event.id);
      emit(DeleteSucess());
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _addSpending(
    AddEconoomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    await service.addEconomy(element: event.element);
    emit(BlocSuccess());
  }

  Future<void> _getSpending(
    GetEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      // await service.deleteFolder(event.id);

      // emit(GetHistorySuccess(_repo.get()));

      emit(GetHistorySuccess(service.getEconomy()));
    } catch (error) {
      emit(BlocError());
    }
  }

  Future<void> _wipeData(
    WipeEconomyEvent event,
    Emitter<EconomyBlocState> state,
  ) async {
    try {
      await service.wipeEconomy();
      emit(BlocSuccess());
    } catch (error) {
      emit(BlocError());
    }
  }
}
