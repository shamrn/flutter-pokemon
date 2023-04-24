import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPokemonLoadEvent extends PokemonEvent {
  final String name;

  SearchPokemonLoadEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class RandomPokemonLoadEvent extends PokemonEvent {
  final int number;

  RandomPokemonLoadEvent({required this.number});

  @override
  List<Object?> get props => [int];
}
