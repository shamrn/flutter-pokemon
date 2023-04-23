import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';

abstract class SearchPokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPokemonInitialState extends SearchPokemonState {}

class SearchPokemonLoadingState extends SearchPokemonState {}

class SearchPokemonLoadedState extends SearchPokemonState {
  final PokemonModel pokemon;

  SearchPokemonLoadedState({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class SearchPokemonErrorState extends SearchPokemonState {
  final String errorMessage;

  SearchPokemonErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
