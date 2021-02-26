class PokemonItem {
  final String name;

  PokemonItem({this.name});

  factory PokemonItem.fromJson(Map<String,dynamic> json) {
    return PokemonItem(name: json['name']);
  }
}