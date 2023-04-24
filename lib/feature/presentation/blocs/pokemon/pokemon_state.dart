import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonInitialState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final PokemonModel pokemon;

  PokemonLoadedState({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class PokemonErrorState extends PokemonState {
  final String errorMessage;

  PokemonErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
