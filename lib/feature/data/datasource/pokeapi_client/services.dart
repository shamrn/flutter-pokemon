// The file contains functions for data retrieval

import 'dart:math';

import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/client.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/models.dart';

abstract class Pokemon {
  PokeAPIClient get pokeAPIClient;

  Future<PokemonDTO> getPokemon() async {
    PokeAPIClient pokeAPI = pokeAPIClient;

    await pokeAPI.request();
    Map<dynamic, dynamic>? result = pokeAPI.result;

    if (result != null) {
      return PokemonDTO.fromJson(result);
    } else {
      throw PokeAPIReceiveException();
    }
  }
}

class SearchPokemon extends Pokemon {
  final String name;

  SearchPokemon({required this.name});

  @override
  PokeAPIClient get pokeAPIClient => PokeAPIClient(name: name);
}

class RandomPokemon extends Pokemon {
  final int numberPokemon;

  RandomPokemon({required this.numberPokemon});

  @override
  PokeAPIClient get pokeAPIClient =>
      PokeAPIClient(offset: Random().nextInt(numberPokemon), limit: 1);
}

Future<int> getNumberPokemon() async {
  PokeAPIClient pokeAPIClient = PokeAPIClient();
  await pokeAPIClient.request();
  var result = pokeAPIClient.result;

  if (result != null) {
    return result['count'];
  } else {
    throw PokeAPIReceiveException();
  }
}
