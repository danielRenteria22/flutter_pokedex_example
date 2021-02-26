import 'dart:convert';

import 'package:flutter_pokedex_example/models/pokemon_detail.dart';
import 'package:flutter_pokedex_example/models/pokemon_item.dart';
import 'package:http/http.dart' as http;


class PokemonApi {
  static Future<List<PokemonItem>> getList(int page) async {
    final limit = 20;
    final offset = (page - 1) * limit;
    final reponse = await http.get('https://pokeapi.co/api/v2/pokemon/?limit=$limit&offset=$offset');
    if(reponse.statusCode == 200) {
      Iterable list = jsonDecode(reponse.body)['results'];
      final pokemons = <PokemonItem>[];
      for(Map<String,dynamic> e in list){
        pokemons.add(PokemonItem.fromJson(e));
      }
      return pokemons;
    } else {
      throw Exception('No se pudo cargar la lista');
    }
  }

  static Future<PokemonDetail> getDetail(String name) async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon/$name');
    if(response.statusCode == 200) {
      return PokemonDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargaar el detalle');
    }
  }
}