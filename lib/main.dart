import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:volta/common/repositories/pokemon_repository.dart';
import 'package:volta/features/pokedexx/route.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POKEDEX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(dio: Dio(),),)

      /*HomeContainer(
          repository: PokemonRepository(
              dio: Dio(),
          ),
      ),*/
    );
  }
}

