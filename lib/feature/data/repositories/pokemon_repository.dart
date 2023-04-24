import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/models.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/services.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';

abstract class PokemonRepository {
  Pokemon get pokemonService;

  Future<PokemonModel> getPokemon() async {
    PokemonDTO pokemon = await pokemonService.getPokemon();
    return PokemonModel(
        id: pokemon.id, name: pokemon.name, imageUrl: pokemon.imageUrl);
  }
}

class SearchPokemonRepository extends PokemonRepository {
  final String name;

  SearchPokemonRepository({required this.name});

  @override
  Pokemon get pokemonService => SearchPokemon(name: name);
}

class RandomPokemonRepository extends PokemonRepository {
  final int numberPokemon;

  RandomPokemonRepository({required this.numberPokemon});

  @override
  Pokemon get pokemonService => RandomPokemon(numberPokemon: numberPokemon);
}

class PokemonNumberRepository {
  Future<int> getNumber() async {
    return await getNumberPokemon();
  }
}
