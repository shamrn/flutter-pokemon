import 'package:bloc/bloc.dart';
import 'package:flutter_pokemon/feature/data/repositories/pokemon_repository.dart';

import 'pokemon_number_state.dart';

class PokemonNumberCubit extends Cubit<PokemonNumberState> {
  PokemonNumberCubit() : super(PokemonNumberInitialState());

  void loadPokemonNumber() async {
    emit(PokemonNumberLoadingState());

    try {
      emit(PokemonNumberLoadedState(
          number: await PokemonNumberRepository().getNumber()));
    } catch (_) {
      emit(PokemonNumberErrorState());
    }
  }
}
