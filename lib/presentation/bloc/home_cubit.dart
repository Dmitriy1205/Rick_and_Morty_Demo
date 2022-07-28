import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/data/models/dt_status.dart';
import 'package:rick_and_morty/data/models/episodes.dart';
import 'package:rick_and_morty/data/repository/data_repository.dart';

import '../../data/models/character.dart';
import '../../data/models/locations.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repo}) : super(HomeState(status: DtStatus.initial()));
  DataRepository repo;

  Future<void> getCharacter() async {
    emit(state.copyWith(status: DtStatus.loading()));
    try {
      final character = await repo.getCharacter();
      emit(state.copyWith(status: DtStatus.loaded(), character: character));
    } on Exception catch (e) {
      emit(state.copyWith(status: DtStatus.error(e.toString())));
    }
  }

  Future<void> getEpisode() async {
    emit(state.copyWith(status: DtStatus.loading()));
    try {
      final episode = await repo.getEpisode();
      emit(state.copyWith(status: DtStatus.loaded(), episode: episode));
    } on Exception catch (e) {
      emit(state.copyWith(status: DtStatus.error(),));
    }
  }

  Future<void> getLocation() async {
    emit(state.copyWith(status: DtStatus.loading()));
    try {
      final location = await repo.getLocation();
      emit(state.copyWith(status: DtStatus.loaded(), location: location));
    } on Exception catch (e) {
      emit(state.copyWith(status: DtStatus.error(e.toString())));
    }
  }
}
