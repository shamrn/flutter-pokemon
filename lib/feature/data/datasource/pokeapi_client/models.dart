// The file implements DTO models

class PokemonDTO {
  final String name;
  final String imageUrl;

  PokemonDTO({required this.name, required this.imageUrl});

  PokemonDTO.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        imageUrl =
            json['sprites']['other']['official-artwork']['front_default'];
}
