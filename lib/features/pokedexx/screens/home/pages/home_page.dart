import 'package:flutter/material.dart';
import 'package:volta/common/model/pokemon.dart';
import 'package:volta/features/pokedexx/screens/details/container/detail_container.dart';
import 'package:volta/features/pokedexx/screens/home/pages/widgets/pokemon_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap,}) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            Image.asset('assets/pokeball.png', width: 30, height: 30,),
            Text(
              'Pokédex',
              style: GoogleFonts.righteous(
                textStyle: Theme.of(context).textTheme.headline5,
                fontWeight: FontWeight.w300,
              ),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list.map(
                  (e) => PokemonItemWidget(pokemon: e, onTap: onItemTap, index: list.indexOf(e),),
            ).toList(),
    ),
      ),
    );
  }
}
