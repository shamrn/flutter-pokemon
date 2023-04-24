import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/models.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/services.dart';
import 'package:flutter_pokemon/feature/data/models/pokemon_models.dart';

class SearchPokemonRepository {
  Future<PokemonModel> getPokemon({required String name}) async {
    PokemonDTO pokemon = await getPokemonByName(name: name);
    return PokemonModel(
        id: pokemon.id, name: pokemon.name, imageUrl: pokemon.imageUrl);
  }
}

class RandomPokemonRepository {
  Future<PokemonModel> getPokemon({required int numberPokemon}) async {
    PokemonDTO pokemon = await getRandomPokemon(numberPokemon: numberPokemon);
    return PokemonModel(
        id: pokemon.id, name: pokemon.name, imageUrl: pokemon.imageUrl);
  }
}

class PokemonNumberRepository {
  Future<int> getNumber() async {
    return await getNumberPokemon();
  }
}
