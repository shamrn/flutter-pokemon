import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';
import 'package:flutter_pokemon/feature/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/search_pokemon/search_pokemon_event.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/search_pokemon/search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc() : super(SearchPokemonInitialState()) {
    on<SearchPokemonLoadEvent>(_onSearchPokemon);
  }

  void _onSearchPokemon(
      SearchPokemonLoadEvent event, Emitter<SearchPokemonState> state) async {
    emit(SearchPokemonLoadingState());
    try {
      PokemonModel pokemon =
          await SearchPokemonRepository().getPokemon(name: event.name);
      emit(SearchPokemonLoadedState(pokemon: pokemon));
    } on PokeAPINotFoundException {
      emit(SearchPokemonErrorState(
          errorMessage: 'Покемон не найден')); // todo move in locale
    } catch (_) {
      emit(SearchPokemonErrorState(
          errorMessage: 'Ошибка получения данных')); // todo move in locale
    }
  }
}
