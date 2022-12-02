import 'package:flutter/material.dart';
import 'package:volta/common/model/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({Key? key, required this.isDiffl, required this.pokemon}) : super(key: key);
  final bool isDiffl;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiffl ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            tween: Tween<double> (end: isDiffl ? 100 : 300, begin: isDiffl ? 300 : 100),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiffl ? Colors.black.withOpacity(0.4) : null,
              );
            }
        ),
      ),
    );;
  }
}
