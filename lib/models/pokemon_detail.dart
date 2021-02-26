class PokemonDetail {
  final String name;
  final Sprites sprites;
  final List<Type> types;

  PokemonDetail({this.name,this.sprites,this.types});

  factory PokemonDetail.fromJson(Map<String, dynamic> json){
    Iterable types = json['types'];
    return PokemonDetail(
        name: json['name'],
        sprites: Sprites.fromJson(json['sprites']),
        types: List<Type>.from(types.map((e) => Type.fromJson(e)))
    );
  }
}

class Sprites {
  final String front_default;

  Sprites({this.front_default});

  factory Sprites.fromJson(Map<String, dynamic> json){
    return Sprites(
        front_default: json['front_default']
    );
  }
}

class Type {
  final TypeDetail type;

  Type({this.type});

  factory Type.fromJson(Map<String, dynamic> json){
    return Type(
        type: TypeDetail.fromJson(json['type'])
    );
  }
}

class TypeDetail {
  final String name;
  final String url;

  TypeDetail({this.name,this.url});

  factory TypeDetail.fromJson(Map<String, dynamic> json){
    return TypeDetail(
        name: json['name'],
        url: json['url']
    );
  }
}