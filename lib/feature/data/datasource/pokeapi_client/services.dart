// The file contains functions for data retrieval

import 'dart:math';

import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/client.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/models.dart';

abstract class Pokemon {
  // Basic service interface

  Future<PokemonDTO> getPokemon();
}

class SearchPokemon implements Pokemon {
  // Implementing a pokemon search service

  final String name;

  SearchPokemon({required this.name});

  @override
  Future<PokemonDTO> getPokemon() async {
    PokeAPIClient pokeAPIClient = PokeAPIClient(name: name);

    await pokeAPIClient.request();
    Map<dynamic, dynamic>? result = pokeAPIClient.result;

    if (result != null) {
      return PokemonDTO.fromJson(result);
    } else {
      throw PokeAPIReceiveException();
    }
  }
}

class RandomPokemon extends Pokemon {
  // Implementing random pokemon service

  final int numberPokemon;

  RandomPokemon({required this.numberPokemon});

  @override
  Future<PokemonDTO> getPokemon() async {
    PokeAPIClient randomPokeApi = PokeAPIClient(
        offset: Random().nextInt(numberPokemon).toString(), limit: '1');

    await randomPokeApi.request();
    Map<dynamic, dynamic>? resultPokemons = randomPokeApi.result;

    try {
      List<dynamic> results = resultPokemons!['results'];

      PokeAPIClient pokeApi = PokeAPIClient(name: results.first['name']);
      await pokeApi.request();
      Map<dynamic, dynamic>? result = pokeApi.result;

      if (result != null) {
        return PokemonDTO.fromJson(result);
      } else {
        throw PokeAPIReceiveException();
      }
    } catch (_) {
      throw PokeAPIReceiveException();
    }
  }
}

Future<int> getNumberPokemon() async {
  // Function returns the number of pokemon.
  // Defined by the count field in the returned Json object

  PokeAPIClient pokeAPIClient = PokeAPIClient();
  await pokeAPIClient.request();
  var result = pokeAPIClient.result;

  if (result != null) {
    return result['count'];
  } else {
    throw PokeAPIReceiveException();
  }
}
