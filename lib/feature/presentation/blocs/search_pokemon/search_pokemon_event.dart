import 'package:equatable/equatable.dart';

abstract class SearchPokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPokemonLoadEvent extends SearchPokemonEvent {
  final String name;

  SearchPokemonLoadEvent({required this.name});

  @override
  List<Object?> get props => [name];
}
