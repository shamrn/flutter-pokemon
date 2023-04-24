// The file implements DTO models

class PokemonDTO {
  final int id;
  final String name;
  final String imageUrl;

  PokemonDTO({required this.id, required this.name, required this.imageUrl});

  PokemonDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl =
            json['sprites']['other']['official-artwork']['front_default'];
}
