// The file contains functions for data retrieval

import 'dart:math';

import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/client.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/models.dart';

Future<PokemonDTO> getPokemonByName({
  required String name,
}) async {
  PokeAPIClient pokeAPIClient = PokeAPIClient(name: name);
  await pokeAPIClient.request();
  var result = pokeAPIClient.result;

  if (result != null) {
    return PokemonDTO.fromJson(result);
  } else {
    throw PokeAPIReceiveException();
  }
}

Future<PokemonDTO> getRandomPokemon({
  required int numberPokemon,
}) async {
  PokeAPIClient pokeAPIClient =
      PokeAPIClient(offset: Random().nextInt(numberPokemon), limit: 1);
  await pokeAPIClient.request();
  var result = pokeAPIClient.result;

  if (result != null) {
    return PokemonDTO.fromJson(result);
  } else {
    throw PokeAPIReceiveException();
  }
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
