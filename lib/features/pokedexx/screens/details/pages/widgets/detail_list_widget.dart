import 'package:flutter/material.dart';
import 'package:volta/common/model/pokemon.dart';
import 'package:volta/features/pokedexx/screens/details/pages/widgets/detail_item_list_widget.dart';
import 'package:volta/features/pokedexx/screens/details/pages/widgets/detail_type_widget.dart';


class DetailListWidget extends StatelessWidget {
  const DetailListWidget({Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangedPokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangedPokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(pokemon.name,
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                          ),
                        ),
                      ),
                      Text('#${pokemon.num}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type.map((e) => DetailTypeWidget(name: e)).toList(),
                      ),
                      Flexible(
                          child: Container(
                            height: 100,
                            width: 100,
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) => onChangedPokemon(list[index]),
                  controller: controller,
                  children: list.map(
                        (e) {
                          bool diff = e.name != pokemon.name;
                          return DetailItemListWidget(isDiffl: diff, pokemon: e,);
                        }
                  ).toList(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
