import 'package:flutter/material.dart';
import 'package:flutter_pokedex_example/screens/detail.dart';
import 'package:flutter_pokedex_example/screens/lista_pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        '/': (context) => ListaPokemon(),
        '/detail': (context) => Detail()
      },
      initialRoute: '/',
    );
  }
}