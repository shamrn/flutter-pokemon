abstract class PokemonNumberState {}

class PokemonNumberInitialState extends PokemonNumberState {}

class PokemonNumberLoadingState extends PokemonNumberState {}

class PokemonNumberLoadedState extends PokemonNumberState {
  final int number;

  PokemonNumberLoadedState({required this.number});
}

class PokemonNumberErrorState extends PokemonNumberState {}
