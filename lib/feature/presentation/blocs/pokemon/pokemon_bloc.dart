import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_settings.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';
import 'package:flutter_pokemon/feature/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_event.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<AppLocalizations> _appLocalizations =
      AppLocalizations.delegate.load(AppSettings.defaultLocale);

  PokemonBloc() : super(PokemonInitialState()) {
    on<SearchPokemonLoadEvent>(_onSearchPokemon);
    on<RandomPokemonLoadEvent>(_onRandomPokemon);
  }

  void _onRandomPokemon(
      RandomPokemonLoadEvent event, Emitter<PokemonState> state) async {
    _loadPokemon(RandomPokemonRepository(numberPokemon: event.number));
  }

  void _onSearchPokemon(
      SearchPokemonLoadEvent event, Emitter<PokemonState> state) async {
    _loadPokemon(SearchPokemonRepository(name: event.name));
  }

  void _loadPokemon(PokemonRepository pokemonRepository) async {
    AppLocalizations locale = await _appLocalizations;

    emit(PokemonLoadingState());
    try {
      PokemonModel pokemon = await pokemonRepository.getPokemon();
      emit(PokemonLoadedState(pokemon: pokemon));
    } on PokeAPINotFoundException {
      emit(PokemonErrorState(errorMessage: locale.pokemonNotFound));
    } catch (_) {
      emit(PokemonErrorState(
          errorMessage: locale.pokemonRetrievalError));
    }
  }
}
