// The file implements http client for pokeAPI service

import 'dart:convert';
import 'dart:io';

import 'package:flutter_pokemon/common/app_constants/app_api.dart';
import 'package:flutter_pokemon/feature/data/datasource/pokeapi_client/exceptions.dart';
import 'package:http/http.dart' as http;

class PokeAPIClient {
  static const String url = AppApi.pokeAPIUrl;
  static const String apiPath = AppApi.apiPath;
  static const String apiVersion = AppApi.pokeAPIVersion;
  static const String pokemonEndpoint = AppApi.pokeApiPokemonEndpoint;

  final String? name;
  final String? offset;
  final String? limit;

  Map<dynamic, dynamic>? _result;

  Map<dynamic, dynamic>? get result => _result;

  PokeAPIClient({this.name, this.offset, this.limit});

  Future request() async {
    // The method implements an http request

    Uri uri = Uri.https(url, _getEndpoint(), _params);

    final response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      _result = json.decode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == HttpStatus.notFound) {
      throw PokeAPINotFoundException();
    } else {
      throw PokeAPIBadRequestException();
    }
  }

  String _getEndpoint() {
    // Method for concatenating uri
    String endpoint = '$apiPath/$apiVersion/$pokemonEndpoint';
    if (name != null) {
      endpoint = '$endpoint/$name';
    }

    return endpoint;
  }

  Map<String, dynamic> get _params => {
    // Property returns the query parameters
        'offset': offset,
        'limit': limit,
      };
}
