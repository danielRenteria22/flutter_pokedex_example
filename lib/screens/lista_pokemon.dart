import 'package:flutter/material.dart';
import 'package:flutter_pokedex_example/api/pokemon_api.dart';
import 'package:flutter_pokedex_example/models/pokemon_item.dart';

class ListaPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de pokemones'),
      ),
      body: WidgetListaPokemones()
    );
  }
}

class WidgetListaPokemones extends StatefulWidget {
  @override
  _WidgetListaPokemonesState createState() => _WidgetListaPokemonesState();
}

class _WidgetListaPokemonesState extends State<WidgetListaPokemones> {
  final list = <PokemonItem>[];
  bool loading = true;
  int page = 1;
  
  void loadPokemons() {
    loading = true;
    PokemonApi.getList(page).then((List<PokemonItem> result) {
      page++;
      setState(() {
        loading = false;
        list.addAll(result);
      });
    });
  }

  void goToDetail(String name) {
    final arguments = {
      'name': name
    };
    Navigator.pushNamed(context,'/detail',arguments: arguments);
  }

  @override
  void initState() {
    super.initState();
    loadPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        // Si esta cargando, poner una indicacion
        // Si ya se al final de la lista, cargar mas
        // Tenemos que regresar un item de la lista con el pokemon del index
        if(index >= list.length){
          if(!loading) {
            loadPokemons();
          }
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              height: 24,
              width: 24,
            ),
          );
        }

        return ListTile(
          leading: Text(index.toString()),
          title: Text(list[index].name),
          onTap: () => goToDetail(list[index].name),
        );
      },
    );
  }
}
